; Auto-generated. Do not edit!


(cl:in-package rgmc_manipulation-srv)


;//! \htmlinclude NFSRequest-request.msg.html

(cl:defclass <NFSRequest-request> (roslisp-msg-protocol:ros-message)
  ((target_vel
    :reader target_vel
    :initarg :target_vel
    :type cl:float
    :initform 0.0)
   (target_torque
    :reader target_torque
    :initarg :target_torque
    :type cl:float
    :initform 0.0)
   (set_motor_state
    :reader set_motor_state
    :initarg :set_motor_state
    :type cl:boolean
    :initform cl:nil)
   (move
    :reader move
    :initarg :move
    :type cl:boolean
    :initform cl:nil)
   (stop
    :reader stop
    :initarg :stop
    :type cl:boolean
    :initform cl:nil)
   (clear_error
    :reader clear_error
    :initarg :clear_error
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NFSRequest-request (<NFSRequest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NFSRequest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NFSRequest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgmc_manipulation-srv:<NFSRequest-request> is deprecated: use rgmc_manipulation-srv:NFSRequest-request instead.")))

(cl:ensure-generic-function 'target_vel-val :lambda-list '(m))
(cl:defmethod target_vel-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:target_vel-val is deprecated.  Use rgmc_manipulation-srv:target_vel instead.")
  (target_vel m))

(cl:ensure-generic-function 'target_torque-val :lambda-list '(m))
(cl:defmethod target_torque-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:target_torque-val is deprecated.  Use rgmc_manipulation-srv:target_torque instead.")
  (target_torque m))

(cl:ensure-generic-function 'set_motor_state-val :lambda-list '(m))
(cl:defmethod set_motor_state-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:set_motor_state-val is deprecated.  Use rgmc_manipulation-srv:set_motor_state instead.")
  (set_motor_state m))

(cl:ensure-generic-function 'move-val :lambda-list '(m))
(cl:defmethod move-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:move-val is deprecated.  Use rgmc_manipulation-srv:move instead.")
  (move m))

(cl:ensure-generic-function 'stop-val :lambda-list '(m))
(cl:defmethod stop-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:stop-val is deprecated.  Use rgmc_manipulation-srv:stop instead.")
  (stop m))

(cl:ensure-generic-function 'clear_error-val :lambda-list '(m))
(cl:defmethod clear_error-val ((m <NFSRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:clear_error-val is deprecated.  Use rgmc_manipulation-srv:clear_error instead.")
  (clear_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NFSRequest-request>) ostream)
  "Serializes a message object of type '<NFSRequest-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'target_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'target_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'set_motor_state) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'move) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear_error) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NFSRequest-request>) istream)
  "Deserializes a message object of type '<NFSRequest-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_vel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_torque) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'set_motor_state) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'move) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'clear_error) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NFSRequest-request>)))
  "Returns string type for a service object of type '<NFSRequest-request>"
  "rgmc_manipulation/NFSRequestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NFSRequest-request)))
  "Returns string type for a service object of type 'NFSRequest-request"
  "rgmc_manipulation/NFSRequestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NFSRequest-request>)))
  "Returns md5sum for a message object of type '<NFSRequest-request>"
  "1297a10f19670677860ac0dedc54bb5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NFSRequest-request)))
  "Returns md5sum for a message object of type 'NFSRequest-request"
  "1297a10f19670677860ac0dedc54bb5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NFSRequest-request>)))
  "Returns full string definition for message of type '<NFSRequest-request>"
  (cl:format cl:nil "float64 target_vel~%float64 target_torque~%bool set_motor_state~%bool move~%bool stop~%bool clear_error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NFSRequest-request)))
  "Returns full string definition for message of type 'NFSRequest-request"
  (cl:format cl:nil "float64 target_vel~%float64 target_torque~%bool set_motor_state~%bool move~%bool stop~%bool clear_error~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NFSRequest-request>))
  (cl:+ 0
     8
     8
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NFSRequest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NFSRequest-request
    (cl:cons ':target_vel (target_vel msg))
    (cl:cons ':target_torque (target_torque msg))
    (cl:cons ':set_motor_state (set_motor_state msg))
    (cl:cons ':move (move msg))
    (cl:cons ':stop (stop msg))
    (cl:cons ':clear_error (clear_error msg))
))
;//! \htmlinclude NFSRequest-response.msg.html

(cl:defclass <NFSRequest-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NFSRequest-response (<NFSRequest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NFSRequest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NFSRequest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgmc_manipulation-srv:<NFSRequest-response> is deprecated: use rgmc_manipulation-srv:NFSRequest-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <NFSRequest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-srv:result-val is deprecated.  Use rgmc_manipulation-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NFSRequest-response>) ostream)
  "Serializes a message object of type '<NFSRequest-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NFSRequest-response>) istream)
  "Deserializes a message object of type '<NFSRequest-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NFSRequest-response>)))
  "Returns string type for a service object of type '<NFSRequest-response>"
  "rgmc_manipulation/NFSRequestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NFSRequest-response)))
  "Returns string type for a service object of type 'NFSRequest-response"
  "rgmc_manipulation/NFSRequestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NFSRequest-response>)))
  "Returns md5sum for a message object of type '<NFSRequest-response>"
  "1297a10f19670677860ac0dedc54bb5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NFSRequest-response)))
  "Returns md5sum for a message object of type 'NFSRequest-response"
  "1297a10f19670677860ac0dedc54bb5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NFSRequest-response>)))
  "Returns full string definition for message of type '<NFSRequest-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NFSRequest-response)))
  "Returns full string definition for message of type 'NFSRequest-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NFSRequest-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NFSRequest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NFSRequest-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NFSRequest)))
  'NFSRequest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NFSRequest)))
  'NFSRequest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NFSRequest)))
  "Returns string type for a service object of type '<NFSRequest>"
  "rgmc_manipulation/NFSRequest")