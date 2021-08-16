// Auto-generated. Do not edit!

// (in-package realsense_d435.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class objection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.classname = null;
      this.classID = null;
      this.center_point = null;
      this.point_cloud = null;
    }
    else {
      if (initObj.hasOwnProperty('classname')) {
        this.classname = initObj.classname
      }
      else {
        this.classname = '';
      }
      if (initObj.hasOwnProperty('classID')) {
        this.classID = initObj.classID
      }
      else {
        this.classID = 0;
      }
      if (initObj.hasOwnProperty('center_point')) {
        this.center_point = initObj.center_point
      }
      else {
        this.center_point = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('point_cloud')) {
        this.point_cloud = initObj.point_cloud
      }
      else {
        this.point_cloud = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type objection
    // Serialize message field [classname]
    bufferOffset = _serializer.string(obj.classname, buffer, bufferOffset);
    // Serialize message field [classID]
    bufferOffset = _serializer.uint8(obj.classID, buffer, bufferOffset);
    // Serialize message field [center_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.center_point, buffer, bufferOffset);
    // Serialize message field [point_cloud]
    // Serialize the length for message field [point_cloud]
    bufferOffset = _serializer.uint32(obj.point_cloud.length, buffer, bufferOffset);
    obj.point_cloud.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type objection
    let len;
    let data = new objection(null);
    // Deserialize message field [classname]
    data.classname = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [classID]
    data.classID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [center_point]
    data.center_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [point_cloud]
    // Deserialize array length for message field [point_cloud]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.point_cloud = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.point_cloud[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.classname.length;
    length += 12 * object.point_cloud.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'realsense_d435/objection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a84050c2eec09fc0e86c5e0c8e8e706';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new objection(null);
    if (msg.classname !== undefined) {
      resolved.classname = msg.classname;
    }
    else {
      resolved.classname = ''
    }

    if (msg.classID !== undefined) {
      resolved.classID = msg.classID;
    }
    else {
      resolved.classID = 0
    }

    if (msg.center_point !== undefined) {
      resolved.center_point = geometry_msgs.msg.Point.Resolve(msg.center_point)
    }
    else {
      resolved.center_point = new geometry_msgs.msg.Point()
    }

    if (msg.point_cloud !== undefined) {
      resolved.point_cloud = new Array(msg.point_cloud.length);
      for (let i = 0; i < resolved.point_cloud.length; ++i) {
        resolved.point_cloud[i] = geometry_msgs.msg.Point32.Resolve(msg.point_cloud[i]);
      }
    }
    else {
      resolved.point_cloud = []
    }

    return resolved;
    }
};

module.exports = objection;
