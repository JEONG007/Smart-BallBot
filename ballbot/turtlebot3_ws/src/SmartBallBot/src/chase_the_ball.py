#!/usr/bin/env python
import math, time
from math import pi
import rospy
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Point
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import MultiArrayDimension
from sensor_msgs.msg import LaserScan 
from math import radians, degrees, sqrt
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion


class ChaseBall():
    def __init__ (self):
        #angle
        self.blob_x=0.0
        #depth
        self.blob_y=0.0
        self.angle = 0.0

        self._time_detected=0.0

        self.sub_center=rospy.Subscriber("detect",Float32MultiArray, self.update_ball)
        self.sub_odom = rospy.Subscriber('/odom', Odometry, self.odomCallback)
        odom = rospy.wait_for_message('/odom', Odometry)
        rospy.loginfo("Subsribers set")

        self.start_angle = self.angle
        self.temp_down_start_angle = 0
        self.start_time = 0

        self.findBall_forward_flag = False
        self.no_detected_ball = False

        self.pub_twist=rospy.Publisher("cmd_vel",Twist,queue_size=5)
        rospy.loginfo("Publisher set")

        self._message=Twist()

        self._time_steer=0
        self._steer_sign_prev=0
        self.temp_turn_start_angle = 0

        self.turn_value = 25
        self.rk = 0.2

    def odomCallback(self, odom):
        _, _, yaw = euler_from_quaternion([odom.pose.pose.orientation.x, odom.pose.pose.orientation.y, odom.pose.pose.orientation.z, odom.pose.pose.orientation.w])
        self.angle = yaw

    def is_detected(self):
        return time.time()-self._time_detected<1.0
 
    def update_ball(self,message):
        self.blob_y=message.data[0]
        self.blob_x=message.data[1]
        self._time_detected=time.time()

    def get_control_action(self):
        if self.is_detected:    
            if self.blob_x == -1:
                steer_action, throttle_action = self.findBall()
                self.no_detected_ball = True
            elif self.blob_x > 220 and self.blob_x <= 420:
                steer_action = 0
                throttle_action = 0.4
                self.no_detected_ball = False
            else:
                steer_action = math.cos((pi / 640) * self.blob_x)
                throttle_action = 0.4
                self.no_detected_ball = False

            rospy.loginfo("Steering command %.2f"%steer_action)
    
        return steer_action, throttle_action
    def findBall(self): 
        if self.no_detected_ball == False:
            self.start_angle = self.angle
            self.temp_down_start_angle = self.start_angle - 0.1

            if self.temp_down_start_angle > pi:
                self.temp_down_start_angle -= 2 * pi
            elif self.temp_down_start_angle < -pi:
                self.temp_down_start_angle += 2 * pi
            self.start_time = time.time()


        rospy.loginfo("self.angle %.2f"%self.angle)
        rospy.loginfo("self.start_angle %.2f"%self.start_angle)    
        

        if self.findBall_forward_flag == True:
            ##spiral
            # steer_action,throttle_action = self.spiral_move()
            ## forward
            steer_action = 0
            throttle_action = 0.4
            # if (time.time() - self.start_time) < 25:
            #     steer_action = 0
            #     throttle_action = 0.4
            #     # self.no_detected_ball = True
            #     print(time.time() - self.start_time)
            # else:
            #     steer_action = 0.4
            #     throttle_action = 0
            #     self.findBall_forward_flag = False
            #     self.no_detected_ball = False


            # square
            # if (time.time() - self.start_time) < self.turn_value:##5sec forward
            #     steer_action = 0
            #     throttle_action = 0.2
            #     print("square_forward")
            #     t0	= rospy.Time.now().to_sec()
	        #     angle_travelled = 0
            # else:
            #     if angle_travelled < pi/2.0:
            #         steer_action = 0.2
            #         throttle_action = 0
            #         t1 = rospy.Time.now().to_sec()
		    #         angle_travelled = 0.2*(t1-t0)
            #         print("square_turn")
            #     else:
            #         self.start_time = time.time()
            #         self.turn_value += self.turn_value*0.1
            #         self.no_detected_ball = False
            #         print("square_re")
        else:
            if self.temp_down_start_angle > self.start_angle:
                self.temp_down_start_angle, self.start_angle = self.start_angle, self.temp_down_start_angle
            if not (self.temp_down_start_angle < self.angle and self.start_angle > self.angle):
                steer_action = 0.4
                throttle_action = 0
                print("trun_else")
            else:
                steer_action = 0
                throttle_action = 0.4
                self.findBall_forward_flag = True
                self.no_detected_ball = False
                print("forward_else")
        steer_action = 0
        throttle_action = 0.4   
        return steer_action, throttle_action

    def spiral_move(self):
        print(time.time()-self.start_time)
        if (time.time()-self.start_time)>10:
            self.rk +=  self.rk*0.1
            self.start_time = time.time()
            return  0.4,self.rk
        return  0.4,self.rk

    def run(self):
        #Get the control action
        steer_action, throttle_action = self.get_control_action()
        rospy.loginfo("Steering=%3.1f"%(steer_action))
        rospy.loginfo("throttle_action=%3.1f"%(throttle_action))

        self._message.linear.x = throttle_action
        self._message.angular.z = steer_action

        #publish it
        self.pub_twist.publish(self._message)
