// Auto-generated. Do not edit!

// (in-package rgmc_manipulation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ParallelSpinPadsGripperCommandGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.par_target_pos = null;
      this.par_max_effort = null;
      this.par_velocity = null;
      this.actuate_parallel = null;
      this.pads_target_pos = null;
      this.pads_max_effort = null;
      this.pads_velocity = null;
      this.actuate_pads = null;
      this.reverse_pads_actuation = null;
    }
    else {
      if (initObj.hasOwnProperty('par_target_pos')) {
        this.par_target_pos = initObj.par_target_pos
      }
      else {
        this.par_target_pos = 0.0;
      }
      if (initObj.hasOwnProperty('par_max_effort')) {
        this.par_max_effort = initObj.par_max_effort
      }
      else {
        this.par_max_effort = 0.0;
      }
      if (initObj.hasOwnProperty('par_velocity')) {
        this.par_velocity = initObj.par_velocity
      }
      else {
        this.par_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('actuate_parallel')) {
        this.actuate_parallel = initObj.actuate_parallel
      }
      else {
        this.actuate_parallel = false;
      }
      if (initObj.hasOwnProperty('pads_target_pos')) {
        this.pads_target_pos = initObj.pads_target_pos
      }
      else {
        this.pads_target_pos = 0.0;
      }
      if (initObj.hasOwnProperty('pads_max_effort')) {
        this.pads_max_effort = initObj.pads_max_effort
      }
      else {
        this.pads_max_effort = 0.0;
      }
      if (initObj.hasOwnProperty('pads_velocity')) {
        this.pads_velocity = initObj.pads_velocity
      }
      else {
        this.pads_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('actuate_pads')) {
        this.actuate_pads = initObj.actuate_pads
      }
      else {
        this.actuate_pads = false;
      }
      if (initObj.hasOwnProperty('reverse_pads_actuation')) {
        this.reverse_pads_actuation = initObj.reverse_pads_actuation
      }
      else {
        this.reverse_pads_actuation = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ParallelSpinPadsGripperCommandGoal
    // Serialize message field [par_target_pos]
    bufferOffset = _serializer.float64(obj.par_target_pos, buffer, bufferOffset);
    // Serialize message field [par_max_effort]
    bufferOffset = _serializer.float64(obj.par_max_effort, buffer, bufferOffset);
    // Serialize message field [par_velocity]
    bufferOffset = _serializer.float64(obj.par_velocity, buffer, bufferOffset);
    // Serialize message field [actuate_parallel]
    bufferOffset = _serializer.bool(obj.actuate_parallel, buffer, bufferOffset);
    // Serialize message field [pads_target_pos]
    bufferOffset = _serializer.float64(obj.pads_target_pos, buffer, bufferOffset);
    // Serialize message field [pads_max_effort]
    bufferOffset = _serializer.float64(obj.pads_max_effort, buffer, bufferOffset);
    // Serialize message field [pads_velocity]
    bufferOffset = _serializer.float64(obj.pads_velocity, buffer, bufferOffset);
    // Serialize message field [actuate_pads]
    bufferOffset = _serializer.bool(obj.actuate_pads, buffer, bufferOffset);
    // Serialize message field [reverse_pads_actuation]
    bufferOffset = _serializer.bool(obj.reverse_pads_actuation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ParallelSpinPadsGripperCommandGoal
    let len;
    let data = new ParallelSpinPadsGripperCommandGoal(null);
    // Deserialize message field [par_target_pos]
    data.par_target_pos = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [par_max_effort]
    data.par_max_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [par_velocity]
    data.par_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [actuate_parallel]
    data.actuate_parallel = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pads_target_pos]
    data.pads_target_pos = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pads_max_effort]
    data.pads_max_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pads_velocity]
    data.pads_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [actuate_pads]
    data.actuate_pads = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [reverse_pads_actuation]
    data.reverse_pads_actuation = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 51;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rgmc_manipulation/ParallelSpinPadsGripperCommandGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb68d13aae1dc06acb5bf6743e7c751f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # When performing an action that uses the parallel jaw and the pads at the same time,
    # The parallel jaw one will be done first.
    # GOAL
    float64 par_target_pos  # Parallel gripper target aperture (in meters)
    float64 par_max_effort  # Parallel gripper motor max motor current
    float64 par_velocity    # Parallel gripper motor velocity
    bool actuate_parallel   # Whether to actuate the parallel gripper or not
    float64 pads_target_pos # Fingertip pads target angular position (in radians)
    float64 pads_max_effort # Fingertip pads motor max current (in mA)
    float64 pads_velocity   # Fingertip pads motor target velocity
    bool actuate_pads       # Whether to actuate the rotary pads or not
    bool reverse_pads_actuation       # Actuate rotary pads in reverse
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ParallelSpinPadsGripperCommandGoal(null);
    if (msg.par_target_pos !== undefined) {
      resolved.par_target_pos = msg.par_target_pos;
    }
    else {
      resolved.par_target_pos = 0.0
    }

    if (msg.par_max_effort !== undefined) {
      resolved.par_max_effort = msg.par_max_effort;
    }
    else {
      resolved.par_max_effort = 0.0
    }

    if (msg.par_velocity !== undefined) {
      resolved.par_velocity = msg.par_velocity;
    }
    else {
      resolved.par_velocity = 0.0
    }

    if (msg.actuate_parallel !== undefined) {
      resolved.actuate_parallel = msg.actuate_parallel;
    }
    else {
      resolved.actuate_parallel = false
    }

    if (msg.pads_target_pos !== undefined) {
      resolved.pads_target_pos = msg.pads_target_pos;
    }
    else {
      resolved.pads_target_pos = 0.0
    }

    if (msg.pads_max_effort !== undefined) {
      resolved.pads_max_effort = msg.pads_max_effort;
    }
    else {
      resolved.pads_max_effort = 0.0
    }

    if (msg.pads_velocity !== undefined) {
      resolved.pads_velocity = msg.pads_velocity;
    }
    else {
      resolved.pads_velocity = 0.0
    }

    if (msg.actuate_pads !== undefined) {
      resolved.actuate_pads = msg.actuate_pads;
    }
    else {
      resolved.actuate_pads = false
    }

    if (msg.reverse_pads_actuation !== undefined) {
      resolved.reverse_pads_actuation = msg.reverse_pads_actuation;
    }
    else {
      resolved.reverse_pads_actuation = false
    }

    return resolved;
    }
};

module.exports = ParallelSpinPadsGripperCommandGoal;
