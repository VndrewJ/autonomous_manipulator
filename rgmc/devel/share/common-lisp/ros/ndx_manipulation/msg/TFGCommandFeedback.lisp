; Auto-generated. Do not edit!


(cl:in-package ndx_manipulation-msg)


;//! \htmlinclude TFGCommandFeedback.msg.html

(cl:defclass <TFGCommandFeedback> (roslisp-msg-protocol:ros-message)
  ((stalled
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

(cl:defclass TFGCommandFeedback (<TFGCommandFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TFGCommandFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TFGCommandFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndx_manipulation-msg:<TFGCommandFeedback> is deprecated: use ndx_manipulation-msg:TFGCommandFeedback instead.")))

(cl:ensure-generic-function 'stalled-val :lambda-list '(m))
(cl:defmethod stalled-val ((m <TFGCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:stalled-val is deprecated.  Use ndx_manipulation-msg:stalled instead.")
  (stalled m))

(cl:ensure-generic-function 'reached_goal-val :lambda-list '(m))
(cl:defmethod reached_goal-val ((m <TFGCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndx_manipulation-msg:reached_goal-val is deprecated.  Use ndx_manipulation-msg:reached_goal instead.")
  (reached_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TFGCommandFeedback>) ostream)
  "Serializes a message object of type '<TFGCommandFeedback>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stalled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached_goal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TFGCommandFeedback>) istream)
  "Deserializes a message object of type '<TFGCommandFeedback>"
    (cl:setf (cl:slot-value msg 'stalled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'reached_goal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TFGCommandFeedback>)))
  "Returns string type for a message object of type '<TFGCommandFeedback>"
  "ndx_manipulation/TFGCommandFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TFGCommandFeedback)))
  "Returns string type for a message object of type 'TFGCommandFeedback"
  "ndx_manipulation/TFGCommandFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TFGCommandFeedback>)))
  "Returns md5sum for a message object of type '<TFGCommandFeedback>"
  "71b044b88cc8e801ac03a8af68f2e9b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TFGCommandFeedback)))
  "Returns md5sum for a message object of type 'TFGCommandFeedback"
  "71b044b88cc8e801ac03a8af68f2e9b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TFGCommandFeedback>)))
  "Returns full string definition for message of type '<TFGCommandFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%bool stalled            # True iff the gripper is exerting max effort and not moving~%bool reached_goal       # True iff the gripper position has reached the commanded setpoint~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TFGCommandFeedback)))
  "Returns full string definition for message of type 'TFGCommandFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%bool stalled            # True iff the gripper is exerting max effort and not moving~%bool reached_goal       # True iff the gripper position has reached the commanded setpoint~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TFGCommandFeedback>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TFGCommandFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'TFGCommandFeedback
    (cl:cons ':stalled (stalled msg))
    (cl:cons ':reached_goal (reached_goal msg))
))