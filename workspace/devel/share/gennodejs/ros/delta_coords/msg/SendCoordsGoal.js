// Auto-generated. Do not edit!

// (in-package delta_coords.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class SendCoordsGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.frontal_coord = null;
    }
    else {
      if (initObj.hasOwnProperty('frontal_coord')) {
        this.frontal_coord = initObj.frontal_coord
      }
      else {
        this.frontal_coord = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SendCoordsGoal
    // Serialize message field [frontal_coord]
    // Serialize the length for message field [frontal_coord]
    bufferOffset = _serializer.uint32(obj.frontal_coord.length, buffer, bufferOffset);
    obj.frontal_coord.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SendCoordsGoal
    let len;
    let data = new SendCoordsGoal(null);
    // Deserialize message field [frontal_coord]
    // Deserialize array length for message field [frontal_coord]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.frontal_coord = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.frontal_coord[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.frontal_coord.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'delta_coords/SendCoordsGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fe4b617d9fa0ac1f80b63d721c30ebe9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Define the goal
    geometry_msgs/Point[] frontal_coord  
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SendCoordsGoal(null);
    if (msg.frontal_coord !== undefined) {
      resolved.frontal_coord = new Array(msg.frontal_coord.length);
      for (let i = 0; i < resolved.frontal_coord.length; ++i) {
        resolved.frontal_coord[i] = geometry_msgs.msg.Point.Resolve(msg.frontal_coord[i]);
      }
    }
    else {
      resolved.frontal_coord = []
    }

    return resolved;
    }
};

module.exports = SendCoordsGoal;