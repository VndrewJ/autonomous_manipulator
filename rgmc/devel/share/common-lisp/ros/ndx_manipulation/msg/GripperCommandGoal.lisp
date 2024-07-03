; Auto-generated. Do not edit!


(cl:in-package ndx_manipulation-msg)


;//! \htmlinclude GripperCommandGoal.msg.html

(cl:defclass <GripperCommandGoal> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (max_effort
    :reader max_effort
    :initarg :max_effort
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass GripperCommandGoal (<GripperCommandGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperCommandGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperCommandGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndx_manipulation-msg:<GripperCommandGoal> is deprecated: use ndx_manipulation-msg:GripperCommandGoal instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:position-val is deprecated.  Use ndx_manipulation-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'max_effort-val :lambda-list '(m))
(cl:defmethod max_effort-val ((m <GripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:max_effort-val is deprecated.  Use ndx_manipulation-msg:max_effort instead.")
  (max_effort m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <GripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:velocity-val is deprecated.  Use ndx_manipulation-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperCommandGoal>) ostream)
  "Serializes a message object of type '<GripperCommandGoal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperCommandGoal>) istream)
  "Deserializes a message object of type '<GripperCommandGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperCommandGoal>)))
  "Returns string type for a message object of type '<GripperCommandGoal>"
  "ndx_manipulation/GripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperCommandGoal)))
  "Returns string type for a message object of type 'GripperCommandGoal"
  "ndx_manipulation/GripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperCommandGoal>)))
  "Returns md5sum for a message object of type '<GripperCommandGoal>"
  "2f792f8814a81ae72fa92cd976556ebf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperCommandGoal)))
  "Returns md5sum for a message object of type 'GripperCommandGoal"
  "2f792f8814a81ae72fa92cd976556ebf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperCommandGoal>)))
  "Returns full string definition for message of type '<GripperCommandGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%float64 position    # The current gripper gap size (in meters)~%float64 max_effort  # Max motor current~%float64 velocity    # Motor velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperCommandGoal)))
  "Returns full string definition for message of type 'GripperCommandGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%float64 position    # The current gripper gap size (in meters)~%float64 max_effort  # Max motor current~%float64 velocity    # Motor velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperCommandGoal>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperCommandGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperCommandGoal
    (cl:cons ':position (position msg))
    (cl:cons ':max_effort (max_effort msg))
    (cl:cons ':velocity (velocity msg))
))
