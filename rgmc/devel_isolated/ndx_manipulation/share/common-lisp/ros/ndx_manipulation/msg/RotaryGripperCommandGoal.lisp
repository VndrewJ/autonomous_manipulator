; Auto-generated. Do not edit!


(cl:in-package ndx_manipulation-msg)


;//! \htmlinclude RotaryGripperCommandGoal.msg.html

(cl:defclass <RotaryGripperCommandGoal> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (offset
    :reader offset
    :initarg :offset
    :type cl:integer
    :initform 0)
   (effort
    :reader effort
    :initarg :effort
    :type cl:integer
    :initform 0))
)

(cl:defclass RotaryGripperCommandGoal (<RotaryGripperCommandGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotaryGripperCommandGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotaryGripperCommandGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndx_manipulation-msg:<RotaryGripperCommandGoal> is deprecated: use ndx_manipulation-msg:RotaryGripperCommandGoal instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <RotaryGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:type-val is deprecated.  Use ndx_manipulation-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <RotaryGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:offset-val is deprecated.  Use ndx_manipulation-msg:offset instead.")
  (offset m))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <RotaryGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:effort-val is deprecated.  Use ndx_manipulation-msg:effort instead.")
  (effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotaryGripperCommandGoal>) ostream)
  "Serializes a message object of type '<RotaryGripperCommandGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotaryGripperCommandGoal>) istream)
  "Deserializes a message object of type '<RotaryGripperCommandGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotaryGripperCommandGoal>)))
  "Returns string type for a message object of type '<RotaryGripperCommandGoal>"
  "ndx_manipulation/RotaryGripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotaryGripperCommandGoal)))
  "Returns string type for a message object of type 'RotaryGripperCommandGoal"
  "ndx_manipulation/RotaryGripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotaryGripperCommandGoal>)))
  "Returns md5sum for a message object of type '<RotaryGripperCommandGoal>"
  "368af3338434120067228a0799903707")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotaryGripperCommandGoal)))
  "Returns md5sum for a message object of type 'RotaryGripperCommandGoal"
  "368af3338434120067228a0799903707")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotaryGripperCommandGoal>)))
  "Returns full string definition for message of type '<RotaryGripperCommandGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string type       # Can be 'open', 'close' or ''. If 'open' or 'close', clutch is engaged.~%int32 offset      # Rotation offset. If positive, rotation is clockwise.~%int32 effort      # Max motor current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotaryGripperCommandGoal)))
  "Returns full string definition for message of type 'RotaryGripperCommandGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string type       # Can be 'open', 'close' or ''. If 'open' or 'close', clutch is engaged.~%int32 offset      # Rotation offset. If positive, rotation is clockwise.~%int32 effort      # Max motor current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotaryGripperCommandGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotaryGripperCommandGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'RotaryGripperCommandGoal
    (cl:cons ':type (type msg))
    (cl:cons ':offset (offset msg))
    (cl:cons ':effort (effort msg))
))
