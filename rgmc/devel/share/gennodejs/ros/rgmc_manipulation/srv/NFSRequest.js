// Auto-generated. Do not edit!

// (in-package rgmc_manipulation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class NFSRequestRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_vel = null;
      this.target_torque = null;
      this.set_motor_state = null;
      this.move = null;
      this.stop = null;
      this.clear_error = null;
    }
    else {
      if (initObj.hasOwnProperty('target_vel')) {
        this.target_vel = initObj.target_vel
      }
      else {
        this.target_vel = 0.0;
      }
      if (initObj.hasOwnProperty('target_torque')) {
        this.target_torque = initObj.target_torque
      }
      else {
        this.target_torque = 0.0;
      }
      if (initObj.hasOwnProperty('set_motor_state')) {
        this.set_motor_state = initObj.set_motor_state
      }
      else {
        this.set_motor_state = false;
      }
      if (initObj.hasOwnProperty('move')) {
        this.move = initObj.move
      }
      else {
        this.move = false;
      }
      if (initObj.hasOwnProperty('stop')) {
        this.stop = initObj.stop
      }
      else {
        this.stop = false;
      }
      if (initObj.hasOwnProperty('clear_error')) {
        this.clear_error = initObj.clear_error
      }
      else {
        this.clear_error = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NFSRequestRequest
    // Serialize message field [target_vel]
    bufferOffset = _serializer.float64(obj.target_vel, buffer, bufferOffset);
    // Serialize message field [target_torque]
    bufferOffset = _serializer.float64(obj.target_torque, buffer, bufferOffset);
    // Serialize message field [set_motor_state]
    bufferOffset = _serializer.bool(obj.set_motor_state, buffer, bufferOffset);
    // Serialize message field [move]
    bufferOffset = _serializer.bool(obj.move, buffer, bufferOffset);
    // Serialize message field [stop]
    bufferOffset = _serializer.bool(obj.stop, buffer, bufferOffset);
    // Serialize message field [clear_error]
    bufferOffset = _serializer.bool(obj.clear_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NFSRequestRequest
    let len;
    let data = new NFSRequestRequest(null);
    // Deserialize message field [target_vel]
    data.target_vel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [target_torque]
    data.target_torque = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [set_motor_state]
    data.set_motor_state = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [move]
    data.move = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [stop]
    data.stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [clear_error]
    data.clear_error = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rgmc_manipulation/NFSRequestRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '997bfe360c8f01b6ee2fa25b83e9f4dd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 target_vel
    float64 target_torque
    bool set_motor_state
    bool move
    bool stop
    bool clear_error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NFSRequestRequest(null);
    if (msg.target_vel !== undefined) {
      resolved.target_vel = msg.target_vel;
    }
    else {
      resolved.target_vel = 0.0
    }

    if (msg.target_torque !== undefined) {
      resolved.target_torque = msg.target_torque;
    }
    else {
      resolved.target_torque = 0.0
    }

    if (msg.set_motor_state !== undefined) {
      resolved.set_motor_state = msg.set_motor_state;
    }
    else {
      resolved.set_motor_state = false
    }

    if (msg.move !== undefined) {
      resolved.move = msg.move;
    }
    else {
      resolved.move = false
    }

    if (msg.stop !== undefined) {
      resolved.stop = msg.stop;
    }
    else {
      resolved.stop = false
    }

    if (msg.clear_error !== undefined) {
      resolved.clear_error = msg.clear_error;
    }
    else {
      resolved.clear_error = false
    }

    return resolved;
    }
};

class NFSRequestResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NFSRequestResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NFSRequestResponse
    let len;
    let data = new NFSRequestResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rgmc_manipulation/NFSRequestResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NFSRequestResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: NFSRequestRequest,
  Response: NFSRequestResponse,
  md5sum() { return '1297a10f19670677860ac0dedc54bb5d'; },
  datatype() { return 'rgmc_manipulation/NFSRequest'; }
};
