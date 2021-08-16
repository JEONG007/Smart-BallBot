// Auto-generated. Do not edit!

// (in-package realsense_d435.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let objection = require('./objection.js');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class objectionsofonemat {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.objectionsofonemat = null;
      this.sizeofobjections = null;
      this.pointcloud = null;
      this.ImgRGB = null;
    }
    else {
      if (initObj.hasOwnProperty('objectionsofonemat')) {
        this.objectionsofonemat = initObj.objectionsofonemat
      }
      else {
        this.objectionsofonemat = [];
      }
      if (initObj.hasOwnProperty('sizeofobjections')) {
        this.sizeofobjections = initObj.sizeofobjections
      }
      else {
        this.sizeofobjections = 0;
      }
      if (initObj.hasOwnProperty('pointcloud')) {
        this.pointcloud = initObj.pointcloud
      }
      else {
        this.pointcloud = new sensor_msgs.msg.PointCloud2();
      }
      if (initObj.hasOwnProperty('ImgRGB')) {
        this.ImgRGB = initObj.ImgRGB
      }
      else {
        this.ImgRGB = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type objectionsofonemat
    // Serialize message field [objectionsofonemat]
    // Serialize the length for message field [objectionsofonemat]
    bufferOffset = _serializer.uint32(obj.objectionsofonemat.length, buffer, bufferOffset);
    obj.objectionsofonemat.forEach((val) => {
      bufferOffset = objection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [sizeofobjections]
    bufferOffset = _serializer.uint8(obj.sizeofobjections, buffer, bufferOffset);
    // Serialize message field [pointcloud]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.pointcloud, buffer, bufferOffset);
    // Serialize message field [ImgRGB]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.ImgRGB, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type objectionsofonemat
    let len;
    let data = new objectionsofonemat(null);
    // Deserialize message field [objectionsofonemat]
    // Deserialize array length for message field [objectionsofonemat]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objectionsofonemat = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objectionsofonemat[i] = objection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [sizeofobjections]
    data.sizeofobjections = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pointcloud]
    data.pointcloud = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    // Deserialize message field [ImgRGB]
    data.ImgRGB = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.objectionsofonemat.forEach((val) => {
      length += objection.getMessageSize(val);
    });
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.pointcloud);
    length += sensor_msgs.msg.Image.getMessageSize(object.ImgRGB);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'realsense_d435/objectionsofonemat';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c20814cdec399dd00db133a7fe620641';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    realsense_d435/objection[] objectionsofonemat
    uint8 sizeofobjections
    sensor_msgs/PointCloud2 pointcloud
    sensor_msgs/Image ImgRGB
    ================================================================================
    MSG: realsense_d435/objection
    string classname
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
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: sensor_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new objectionsofonemat(null);
    if (msg.objectionsofonemat !== undefined) {
      resolved.objectionsofonemat = new Array(msg.objectionsofonemat.length);
      for (let i = 0; i < resolved.objectionsofonemat.length; ++i) {
        resolved.objectionsofonemat[i] = objection.Resolve(msg.objectionsofonemat[i]);
      }
    }
    else {
      resolved.objectionsofonemat = []
    }

    if (msg.sizeofobjections !== undefined) {
      resolved.sizeofobjections = msg.sizeofobjections;
    }
    else {
      resolved.sizeofobjections = 0
    }

    if (msg.pointcloud !== undefined) {
      resolved.pointcloud = sensor_msgs.msg.PointCloud2.Resolve(msg.pointcloud)
    }
    else {
      resolved.pointcloud = new sensor_msgs.msg.PointCloud2()
    }

    if (msg.ImgRGB !== undefined) {
      resolved.ImgRGB = sensor_msgs.msg.Image.Resolve(msg.ImgRGB)
    }
    else {
      resolved.ImgRGB = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = objectionsofonemat;
