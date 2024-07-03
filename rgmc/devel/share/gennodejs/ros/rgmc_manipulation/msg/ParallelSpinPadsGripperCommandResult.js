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

class ParallelSpinPadsGripperCommandResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.par_final_position = null;
      this.par_final_effort = null;
      this.par_stalled = null;
      this.par_reached_goal = null;
      this.pads_final_position = null;
      this.pads_final_effort = null;
      this.pads_stalled = null;
      this.pads_reached_goal = null;
    }
    else {
      if (initObj.hasOwnProperty('par_final_position')) {
        this.par_final_position = initObj.par_final_position
      }
      else {
        this.par_final_position = 0.0;
      }
      if (initObj.hasOwnProperty('par_final_effort')) {
        this.par_final_effort = initObj.par_final_effort
      }
      else {
        this.par_final_effort = 0.0;
      }
      if (initObj.hasOwnProperty('par_stalled')) {
        this.par_stalled = initObj.par_stalled
      }
      else {
        this.par_stalled = false;
      }
      if (initObj.hasOwnProperty('par_reached_goal')) {
        this.par_reached_goal = initObj.par_reached_goal
      }
      else {
        this.par_reached_goal = false;
      }
      if (initObj.hasOwnProperty('pads_final_position')) {
        this.pads_final_position = initObj.pads_final_position
      }
      else {
        this.pads_final_position = [];
      }
      if (initObj.hasOwnProperty('pads_final_effort')) {
        this.pads_final_effort = initObj.pads_final_effort
      }
      else {
        this.pads_final_effort = [];
      }
      if (initObj.hasOwnProperty('pads_stalled')) {
        this.pads_stalled = initObj.pads_stalled
      }
      else {
        this.pads_stalled = false;
      }
      if (initObj.hasOwnProperty('pads_reached_goal')) {
        this.pads_reached_goal = initObj.pads_reached_goal
      }
      else {
        this.pads_reached_goal = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ParallelSpinPadsGripperCommandResult
    // Serialize message field [par_final_position]
    bufferOffset = _serializer.float64(obj.par_final_position, buffer, bufferOffset);
    // Serialize message field [par_final_effort]
    bufferOffset = _serializer.float64(obj.par_final_effort, buffer, bufferOffset);
    // Serialize message field [par_stalled]
    bufferOffset = _serializer.bool(obj.par_stalled, buffer, bufferOffset);
    // Serialize message field [par_reached_goal]
    bufferOffset = _serializer.bool(obj.par_reached_goal, buffer, bufferOffset);
    // Serialize message field [pads_final_position]
    bufferOffset = _arraySerializer.float64(obj.pads_final_position, buffer, bufferOffset, null);
    // Serialize message field [pads_final_effort]
    bufferOffset = _arraySerializer.float64(obj.pads_final_effort, buffer, bufferOffset, null);
    // Serialize message field [pads_stalled]
    bufferOffset = _serializer.bool(obj.pads_stalled, buffer, bufferOffset);
    // Serialize message field [pads_reached_goal]
    bufferOffset = _serializer.bool(obj.pads_reached_goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ParallelSpinPadsGripperCommandResult
    let len;
    let data = new ParallelSpinPadsGripperCommandResult(null);
    // Deserialize message field [par_final_position]
    data.par_final_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [par_final_effort]
    data.par_final_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [par_stalled]
    data.par_stalled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [par_reached_goal]
    data.par_reached_goal = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pads_final_position]
    data.pads_final_position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pads_final_effort]
    data.pads_final_effort = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pads_stalled]
    data.pads_stalled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pads_reached_goal]
    data.pads_reached_goal = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.pads_final_position.length;
    length += 8 * object.pads_final_effort.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rgmc_manipulation/ParallelSpinPadsGripperCommandResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e170c820e7fe9881bd93a13cfc59ebbe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # RESULT
    float64 par_final_position  # The final parallel gripper gap size (in meters)
    float64 par_final_effort    # The final parallel gripper effort exerted (motor current)
    bool par_stalled      # True iff the gripper is exerting max effort and not moving
    bool par_reached_goal # True iff the gripper position has reached the commanded setpoint
    float64[] pads_final_position # The final fingertip pads angular position (in radians)
    float64[] pads_final_effort   # The final fingertip pads effort (in mA)
    bool pads_stalled      # True iff one of the pads is exerting max effort and not moving
    bool pads_reached_goal # True iff both pads reached goal position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ParallelSpinPadsGripperCommandResult(null);
    if (msg.par_final_position !== undefined) {
      resolved.par_final_position = msg.par_final_position;
    }
    else {
      resolved.par_final_position = 0.0
    }

    if (msg.par_final_effort !== undefined) {
      resolved.par_final_effort = msg.par_final_effort;
    }
    else {
      resolved.par_final_effort = 0.0
    }

    if (msg.par_stalled !== undefined) {
      resolved.par_stalled = msg.par_stalled;
    }
    else {
      resolved.par_stalled = false
    }

    if (msg.par_reached_goal !== undefined) {
      resolved.par_reached_goal = msg.par_reached_goal;
    }
    else {
      resolved.par_reached_goal = false
    }

    if (msg.pads_final_position !== undefined) {
      resolved.pads_final_position = msg.pads_final_position;
    }
    else {
      resolved.pads_final_position = []
    }

    if (msg.pads_final_effort !== undefined) {
      resolved.pads_final_effort = msg.pads_final_effort;
    }
    else {
      resolved.pads_final_effort = []
    }

    if (msg.pads_stalled !== undefined) {
      resolved.pads_stalled = msg.pads_stalled;
    }
    else {
      resolved.pads_stalled = false
    }

    if (msg.pads_reached_goal !== undefined) {
      resolved.pads_reached_goal = msg.pads_reached_goal;
    }
    else {
      resolved.pads_reached_goal = false
    }

    return resolved;
    }
};

module.exports = ParallelSpinPadsGripperCommandResult;
