; Auto-generated. Do not edit!


(cl:in-package ndx_manipulation-msg)


;//! \htmlinclude RotaryGripperCommandResult.msg.html

(cl:defclass <RotaryGripperCommandResult> (roslisp-msg-protocol:ros-message)
  ((offset
    :reader offset
    :initarg :offset
    :type cl:integer
    :initform 0)
   (effort
    :reader effort
    :initarg :effort
    :type cl:integer
    :initform 0)
   (stalled
    :reader stalled
    :initarg :stalled
    :type cl:boolean
    :initform cl:nil)
   (reached_goal
    :reader reached_goal
    :initarg :reached_goal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RotaryGripperCommandResult (<RotaryGripperCommandResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotaryGripperCommandResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotaryGripperCommandResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndx_manipulation-msg:<RotaryGripperCommandResult> is deprecated: use ndx_manipulation-msg:RotaryGripperCommandResult instead.")))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <RotaryGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:offset-val is deprecated.  Use ndx_manipulation-msg:offset instead.")
  (offset m))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <RotaryGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:effort-val is deprecated.  Use ndx_manipulation-msg:effort instead.")
  (effort m))

(cl:ensure-generic-function 'stalled-val :lambda-list '(m))
(cl:defmethod stalled-val ((m <RotaryGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:stalled-val is deprecated.  Use ndx_manipulation-msg:stalled instead.")
  (stalled m))

(cl:ensure-generic-function 'reached_goal-val :lambda-list '(m))
(cl:defmethod reached_goal-val ((m <RotaryGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:reached_goal-val is deprecated.  Use ndx_manipulation-msg:reached_goal instead.")
  (reached_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotaryGripperCommandResult>) ostream)
  "Serializes a message object of type '<RotaryGripperCommandResult>"
  (cl:let* ((signed (cl:slot-value msg 'offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'effort)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stalled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached_goal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotaryGripperCommandResult>) istream)
  "Deserializes a message object of type '<RotaryGripperCommandResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'offset) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'effort) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'stalled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'reached_goal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotaryGripperCommandResult>)))
  "Returns string type for a message object of type '<RotaryGripperCommandResult>"
  "ndx_manipulation/RotaryGripperCommandResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotaryGripperCommandResult)))
  "Returns string type for a message object of type 'RotaryGripperCommandResult"
  "ndx_manipulation/RotaryGripperCommandResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotaryGripperCommandResult>)))
  "Returns md5sum for a message object of type '<RotaryGripperCommandResult>"
  "fd488db10a012c41d0a550294a11d7f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotaryGripperCommandResult)))
  "Returns md5sum for a message object of type 'RotaryGripperCommandResult"
  "fd488db10a012c41d0a550294a11d7f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotaryGripperCommandResult>)))
  "Returns full string definition for message of type '<RotaryGripperCommandResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 offset      # The current rotation offset~%int32 effort      # The current effort exerted (motor current)~%bool stalled      # True iff the gripper is exerting max effort and not moving~%bool reached_goal # True iff the gripper position has reached the commanded setpoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotaryGripperCommandResult)))
  "Returns full string definition for message of type 'RotaryGripperCommandResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 offset      # The current rotation offset~%int32 effort      # The current effort exerted (motor current)~%bool stalled      # True iff the gripper is exerting max effort and not moving~%bool reached_goal # True iff the gripper position has reached the commanded setpoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotaryGripperCommandResult>))
  (cl:+ 0
     4
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotaryGripperCommandResult>))
  "Converts a ROS message object to a list"
  (cl:list 'RotaryGripperCommandResult
    (cl:cons ':offset (offset msg))
    (cl:cons ':effort (effort msg))
    (cl:cons ':stalled (stalled msg))
    (cl:cons ':reached_goal (reached_goal msg))
))
