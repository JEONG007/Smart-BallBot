;; Auto-generated. Do not edit!


(when (boundp 'realsense_d435::objection)
  (if (not (find-package "REALSENSE_D435"))
    (make-package "REALSENSE_D435"))
  (shadow 'objection (find-package "REALSENSE_D435")))
(unless (find-package "REALSENSE_D435::OBJECTION")
  (make-package "REALSENSE_D435::OBJECTION"))

(in-package "ROS")
;;//! \htmlinclude objection.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass realsense_d435::objection
  :super ros::object
  :slots (_classname _classID _center_point _point_cloud ))

(defmethod realsense_d435::objection
  (:init
   (&key
    ((:classname __classname) "")
    ((:classID __classID) 0)
    ((:center_point __center_point) (instance geometry_msgs::Point :init))
    ((:point_cloud __point_cloud) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    )
   (send-super :init)
   (setq _classname (string __classname))
   (setq _classID (round __classID))
   (setq _center_point __center_point)
   (setq _point_cloud __point_cloud)
   self)
  (:classname
   (&optional __classname)
   (if __classname (setq _classname __classname)) _classname)
  (:classID
   (&optional __classID)
   (if __classID (setq _classID __classID)) _classID)
  (:center_point
   (&rest __center_point)
   (if (keywordp (car __center_point))
       (send* _center_point __center_point)
     (progn
       (if __center_point (setq _center_point (car __center_point)))
       _center_point)))
  (:point_cloud
   (&rest __point_cloud)
   (if (keywordp (car __point_cloud))
       (send* _point_cloud __point_cloud)
     (progn
       (if __point_cloud (setq _point_cloud (car __point_cloud)))
       _point_cloud)))
  (:serialization-length
   ()
   (+
    ;; string _classname
    4 (length _classname)
    ;; uint8 _classID
    1
    ;; geometry_msgs/Point _center_point
    (send _center_point :serialization-length)
    ;; geometry_msgs/Point32[] _point_cloud
    (apply #'+ (send-all _point_cloud :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _classname
       (write-long (length _classname) s) (princ _classname s)
     ;; uint8 _classID
       (write-byte _classID s)
     ;; geometry_msgs/Point _center_point
       (send _center_point :serialize s)
     ;; geometry_msgs/Point32[] _point_cloud
     (write-long (length _point_cloud) s)
     (dolist (elem _point_cloud)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _classname
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _classname (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _classID
     (setq _classID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Point _center_point
     (send _center_point :deserialize buf ptr-) (incf ptr- (send _center_point :serialization-length))
   ;; geometry_msgs/Point32[] _point_cloud
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point_cloud (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _point_cloud)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get realsense_d435::objection :md5sum-) "8a84050c2eec09fc0e86c5e0c8e8e706")
(setf (get realsense_d435::objection :datatype-) "realsense_d435/objection")
(setf (get realsense_d435::objection :definition-)
      "string classname
uint8  classID
geometry_msgs/Point center_point
geometry_msgs/Point32[] point_cloud
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :realsense_d435/objection "8a84050c2eec09fc0e86c5e0c8e8e706")


