; Auto-generated. Do not edit!


(cl:in-package realsense_d435-msg)


;//! \htmlinclude objectionsofonemat.msg.html

(cl:defclass <objectionsofonemat> (roslisp-msg-protocol:ros-message)
  ((objectionsofonemat
    :reader objectionsofonemat
    :initarg :objectionsofonemat
    :type (cl:vector realsense_d435-msg:objection)
   :initform (cl:make-array 0 :element-type 'realsense_d435-msg:objection :initial-element (cl:make-instance 'realsense_d435-msg:objection)))
   (sizeofobjections
    :reader sizeofobjections
    :initarg :sizeofobjections
    :type cl:fixnum
    :initform 0)
   (pointcloud
    :reader pointcloud
    :initarg :pointcloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (ImgRGB
    :reader ImgRGB
    :initarg :ImgRGB
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass objectionsofonemat (<objectionsofonemat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <objectionsofonemat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'objectionsofonemat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_d435-msg:<objectionsofonemat> is deprecated: use realsense_d435-msg:objectionsofonemat instead.")))

(cl:ensure-generic-function 'objectionsofonemat-val :lambda-list '(m))
(cl:defmethod objectionsofonemat-val ((m <objectionsofonemat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:objectionsofonemat-val is deprecated.  Use realsense_d435-msg:objectionsofonemat instead.")
  (objectionsofonemat m))

(cl:ensure-generic-function 'sizeofobjections-val :lambda-list '(m))
(cl:defmethod sizeofobjections-val ((m <objectionsofonemat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:sizeofobjections-val is deprecated.  Use realsense_d435-msg:sizeofobjections instead.")
  (sizeofobjections m))

(cl:ensure-generic-function 'pointcloud-val :lambda-list '(m))
(cl:defmethod pointcloud-val ((m <objectionsofonemat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:pointcloud-val is deprecated.  Use realsense_d435-msg:pointcloud instead.")
  (pointcloud m))

(cl:ensure-generic-function 'ImgRGB-val :lambda-list '(m))
(cl:defmethod ImgRGB-val ((m <objectionsofonemat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_d435-msg:ImgRGB-val is deprecated.  Use realsense_d435-msg:ImgRGB instead.")
  (ImgRGB m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <objectionsofonemat>) ostream)
  "Serializes a message object of type '<objectionsofonemat>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objectionsofonemat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objectionsofonemat))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sizeofobjections)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointcloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ImgRGB) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <objectionsofonemat>) istream)
  "Deserializes a message object of type '<objectionsofonemat>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objectionsofonemat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objectionsofonemat)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'realsense_d435-msg:objection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sizeofobjections)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointcloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ImgRGB) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<objectionsofonemat>)))
  "Returns string type for a message object of type '<objectionsofonemat>"
  "realsense_d435/objectionsofonemat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'objectionsofonemat)))
  "Returns string type for a message object of type 'objectionsofonemat"
  "realsense_d435/objectionsofonemat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<objectionsofonemat>)))
  "Returns md5sum for a message object of type '<objectionsofonemat>"
  "c20814cdec399dd00db133a7fe620641")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'objectionsofonemat)))
  "Returns md5sum for a message object of type 'objectionsofonemat"
  "c20814cdec399dd00db133a7fe620641")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<objectionsofonemat>)))
  "Returns full string definition for message of type '<objectionsofonemat>"
  (cl:format cl:nil "realsense_d435/objection[] objectionsofonemat~%uint8 sizeofobjections~%sensor_msgs/PointCloud2 pointcloud~%sensor_msgs/Image ImgRGB~%================================================================================~%MSG: realsense_d435/objection~%string classname~%uint8  classID~%geometry_msgs/Point center_point~%geometry_msgs/Point32[] point_cloud~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'objectionsofonemat)))
  "Returns full string definition for message of type 'objectionsofonemat"
  (cl:format cl:nil "realsense_d435/objection[] objectionsofonemat~%uint8 sizeofobjections~%sensor_msgs/PointCloud2 pointcloud~%sensor_msgs/Image ImgRGB~%================================================================================~%MSG: realsense_d435/objection~%string classname~%uint8  classID~%geometry_msgs/Point center_point~%geometry_msgs/Point32[] point_cloud~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <objectionsofonemat>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objectionsofonemat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointcloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ImgRGB))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <objectionsofonemat>))
  "Converts a ROS message object to a list"
  (cl:list 'objectionsofonemat
    (cl:cons ':objectionsofonemat (objectionsofonemat msg))
    (cl:cons ':sizeofobjections (sizeofobjections msg))
    (cl:cons ':pointcloud (pointcloud msg))
    (cl:cons ':ImgRGB (ImgRGB msg))
))
