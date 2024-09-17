; Auto-generated. Do not edit!


(cl:in-package ndx_manipulation-msg)


;//! \htmlinclude RotaryGripperCommandActionGoal.msg.html

(cl:defclass <RotaryGripperCommandActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type ndx_manipulation-msg:RotaryGripperCommandGoal
    :initform (cl:make-instance 'ndx_manipulation-msg:RotaryGripperCommandGoal)))
)

(cl:defclass RotaryGripperCommandActionGoal (<RotaryGripperCommandActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotaryGripperCommandActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotaryGripperCommandActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndx_manipulation-msg:<RotaryGripperCommandActionGoal> is deprecated: use ndx_manipulation-msg:RotaryGripperCommandActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RotaryGripperCommandActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:header-val is deprecated.  Use ndx_manipulation-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <RotaryGripperCommandActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:goal_id-val is deprecated.  Use ndx_manipulation-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <RotaryGripperCommandActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:goal-val is deprecated.  Use ndx_manipulation-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotaryGripperCommandActionGoal>) ostream)
  "Serializes a message object of type '<RotaryGripperCommandActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotaryGripperCommandActionGoal>) istream)
  "Deserializes a message object of type '<RotaryGripperCommandActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotaryGripperCommandActionGoal>)))
  "Returns string type for a message object of type '<RotaryGripperCommandActionGoal>"
  "ndx_manipulation/RotaryGripperCommandActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotaryGripperCommandActionGoal)))
  "Returns string type for a message object of type 'RotaryGripperCommandActionGoal"
  "ndx_manipulation/RotaryGripperCommandActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotaryGripperCommandActionGoal>)))
  "Returns md5sum for a message object of type '<RotaryGripperCommandActionGoal>"
  "89198261569fbedb58f4033aa6227248")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotaryGripperCommandActionGoal)))
  "Returns md5sum for a message object of type 'RotaryGripperCommandActionGoal"
  "89198261569fbedb58f4033aa6227248")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotaryGripperCommandActionGoal>)))
  "Returns full string definition for message of type '<RotaryGripperCommandActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%RotaryGripperCommandGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: ndx_manipulation/RotaryGripperCommandGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string type       # Can be 'open', 'close' or ''. If 'open' or 'close', clutch is engaged.~%int32 offset      # Rotation offset. If positive, rotation is clockwise.~%int32 effort      # Max motor current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotaryGripperCommandActionGoal)))
  "Returns full string definition for message of type 'RotaryGripperCommandActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%RotaryGripperCommandGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: ndx_manipulation/RotaryGripperCommandGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string type       # Can be 'open', 'close' or ''. If 'open' or 'close', clutch is engaged.~%int32 offset      # Rotation offset. If positive, rotation is clockwise.~%int32 effort      # Max motor current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotaryGripperCommandActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotaryGripperCommandActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'RotaryGripperCommandActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
