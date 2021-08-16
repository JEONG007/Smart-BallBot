; Auto-generated. Do not edit!


(cl:in-package realsense_d435-msg)


;//! \htmlinclude objection.msg.html

(cl:defclass <objection> (roslisp-msg-protocol:ros-message)
  ((classname
    :reader classname
    :initarg :classname
    :type cl:string
    :initform "")
   (classID
    :reader classID
    :initarg :classID
    :type cl:fixnum
    :initform 0)
   (center_point
    :reader center_point
    :initarg :center_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (point_cloud
    :reader point_cloud
    :initarg :point_cloud
    :type (cl:vector geometry_msgs-msg:Point32)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point32 :initial-element (cl:make-instance 'geometry_msgs-msg:Point32))))
)

(cl:defclass objection (<objection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <objection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'objection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_d435-msg:<objection> is deprecated: use realsense_d435-msg:objection instead.")))

(cl:ensure-generic-function 'classname-val :lambda-list '(m))
(cl:defmethod classname-val ((m <objection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:classname-val is deprecated.  Use realsense_d435-msg:classname instead.")
  (classname m))

(cl:ensure-generic-function 'classID-val :lambda-list '(m))
(cl:defmethod classID-val ((m <objection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:classID-val is deprecated.  Use realsense_d435-msg:classID instead.")
  (classID m))

(cl:ensure-generic-function 'center_point-val :lambda-list '(m))
(cl:defmethod center_point-val ((m <objection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:center_point-val is deprecated.  Use realsense_d435-msg:center_point instead.")
  (center_point m))

(cl:ensure-generic-function 'point_cloud-val :lambda-list '(m))
(cl:defmethod point_cloud-val ((m <objection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:point_cloud-val is deprecated.  Use realsense_d435-msg:point_cloud instead.")
  (point_cloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <objection>) ostream)
  "Serializes a message object of type '<objection>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'classname))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'classname))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classID)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center_point) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point_cloud))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'point_cloud))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <objection>) istream)
  "Deserializes a message object of type '<objection>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'classname) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'classname) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'classID)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center_point) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point_cloud) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point_cloud)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<objection>)))
  "Returns string type for a message object of type '<objection>"
  "realsense_d435/objection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'objection)))
  "Returns string type for a message object of type 'objection"
  "realsense_d435/objection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<objection>)))
  "Returns md5sum for a message object of type '<objection>"
  "8a84050c2eec09fc0e86c5e0c8e8e706")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'objection)))
  "Returns md5sum for a message object of type 'objection"
  "8a84050c2eec09fc0e86c5e0c8e8e706")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<objection>)))
  "Returns full string definition for message of type '<objection>"
  (cl:format cl:nil "string classname~%uint8  classID~%geometry_msgs/Point center_point~%geometry_msgs/Point32[] point_cloud~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'objection)))
  "Returns full string definition for message of type 'objection"
  (cl:format cl:nil "string classname~%uint8  classID~%geometry_msgs/Point center_point~%geometry_msgs/Point32[] point_cloud~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <objection>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'classname))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center_point))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point_cloud) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <objection>))
  "Converts a ROS message object to a list"
  (cl:list 'objection
    (cl:cons ':classname (classname msg))
    (cl:cons ':classID (classID msg))
    (cl:cons ':center_point (center_point msg))
    (cl:cons ':point_cloud (point_cloud msg))
))
