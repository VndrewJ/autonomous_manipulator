; Auto-generated. Do not edit!


(cl:in-package rgmc_manipulation-msg)


;//! \htmlinclude ParallelSpinPadsGripperCommandGoal.msg.html

(cl:defclass <ParallelSpinPadsGripperCommandGoal> (roslisp-msg-protocol:ros-message)
  ((par_target_pos
    :reader par_target_pos
    :initarg :par_target_pos
    :type cl:float
    :initform 0.0)
   (par_max_effort
    :reader par_max_effort
    :initarg :par_max_effort
    :type cl:float
    :initform 0.0)
   (par_velocity
    :reader par_velocity
    :initarg :par_velocity
    :type cl:float
    :initform 0.0)
   (actuate_parallel
    :reader actuate_parallel
    :initarg :actuate_parallel
    :type cl:boolean
    :initform cl:nil)
   (pads_target_pos
    :reader pads_target_pos
    :initarg :pads_target_pos
    :type cl:float
    :initform 0.0)
   (pads_max_effort
    :reader pads_max_effort
    :initarg :pads_max_effort
    :type cl:float
    :initform 0.0)
   (pads_velocity
    :reader pads_velocity
    :initarg :pads_velocity
    :type cl:float
    :initform 0.0)
   (actuate_pads
    :reader actuate_pads
    :initarg :actuate_pads
    :type cl:boolean
    :initform cl:nil)
   (reverse_pads_actuation
    :reader reverse_pads_actuation
    :initarg :reverse_pads_actuation
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ParallelSpinPadsGripperCommandGoal (<ParallelSpinPadsGripperCommandGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ParallelSpinPadsGripperCommandGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ParallelSpinPadsGripperCommandGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgmc_manipulation-msg:<ParallelSpinPadsGripperCommandGoal> is deprecated: use rgmc_manipulation-msg:ParallelSpinPadsGripperCommandGoal instead.")))

(cl:ensure-generic-function 'par_target_pos-val :lambda-list '(m))
(cl:defmethod par_target_pos-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_target_pos-val is deprecated.  Use rgmc_manipulation-msg:par_target_pos instead.")
  (par_target_pos m))

(cl:ensure-generic-function 'par_max_effort-val :lambda-list '(m))
(cl:defmethod par_max_effort-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_max_effort-val is deprecated.  Use rgmc_manipulation-msg:par_max_effort instead.")
  (par_max_effort m))

(cl:ensure-generic-function 'par_velocity-val :lambda-list '(m))
(cl:defmethod par_velocity-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_velocity-val is deprecated.  Use rgmc_manipulation-msg:par_velocity instead.")
  (par_velocity m))

(cl:ensure-generic-function 'actuate_parallel-val :lambda-list '(m))
(cl:defmethod actuate_parallel-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:actuate_parallel-val is deprecated.  Use rgmc_manipulation-msg:actuate_parallel instead.")
  (actuate_parallel m))

(cl:ensure-generic-function 'pads_target_pos-val :lambda-list '(m))
(cl:defmethod pads_target_pos-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_target_pos-val is deprecated.  Use rgmc_manipulation-msg:pads_target_pos instead.")
  (pads_target_pos m))

(cl:ensure-generic-function 'pads_max_effort-val :lambda-list '(m))
(cl:defmethod pads_max_effort-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_max_effort-val is deprecated.  Use rgmc_manipulation-msg:pads_max_effort instead.")
  (pads_max_effort m))

(cl:ensure-generic-function 'pads_velocity-val :lambda-list '(m))
(cl:defmethod pads_velocity-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_velocity-val is deprecated.  Use rgmc_manipulation-msg:pads_velocity instead.")
  (pads_velocity m))

(cl:ensure-generic-function 'actuate_pads-val :lambda-list '(m))
(cl:defmethod actuate_pads-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:actuate_pads-val is deprecated.  Use rgmc_manipulation-msg:actuate_pads instead.")
  (actuate_pads m))

(cl:ensure-generic-function 'reverse_pads_actuation-val :lambda-list '(m))
(cl:defmethod reverse_pads_actuation-val ((m <ParallelSpinPadsGripperCommandGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:reverse_pads_actuation-val is deprecated.  Use rgmc_manipulation-msg:reverse_pads_actuation instead.")
  (reverse_pads_actuation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ParallelSpinPadsGripperCommandGoal>) ostream)
  "Serializes a message object of type '<ParallelSpinPadsGripperCommandGoal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_target_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_max_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'actuate_parallel) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pads_target_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pads_max_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pads_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'actuate_pads) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reverse_pads_actuation) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ParallelSpinPadsGripperCommandGoal>) istream)
  "Deserializes a message object of type '<ParallelSpinPadsGripperCommandGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_target_pos) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_max_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'actuate_parallel) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pads_target_pos) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pads_max_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pads_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'actuate_pads) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'reverse_pads_actuation) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ParallelSpinPadsGripperCommandGoal>)))
  "Returns string type for a message object of type '<ParallelSpinPadsGripperCommandGoal>"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ParallelSpinPadsGripperCommandGoal)))
  "Returns string type for a message object of type 'ParallelSpinPadsGripperCommandGoal"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ParallelSpinPadsGripperCommandGoal>)))
  "Returns md5sum for a message object of type '<ParallelSpinPadsGripperCommandGoal>"
  "cb68d13aae1dc06acb5bf6743e7c751f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ParallelSpinPadsGripperCommandGoal)))
  "Returns md5sum for a message object of type 'ParallelSpinPadsGripperCommandGoal"
  "cb68d13aae1dc06acb5bf6743e7c751f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ParallelSpinPadsGripperCommandGoal>)))
  "Returns full string definition for message of type '<ParallelSpinPadsGripperCommandGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# When performing an action that uses the parallel jaw and the pads at the same time,~%# The parallel jaw one will be done first.~%# GOAL~%float64 par_target_pos  # Parallel gripper target aperture (in meters)~%float64 par_max_effort  # Parallel gripper motor max motor current~%float64 par_velocity    # Parallel gripper motor velocity~%bool actuate_parallel   # Whether to actuate the parallel gripper or not~%float64 pads_target_pos # Fingertip pads target angular position (in radians)~%float64 pads_max_effort # Fingertip pads motor max current (in mA)~%float64 pads_velocity   # Fingertip pads motor target velocity~%bool actuate_pads       # Whether to actuate the rotary pads or not~%bool reverse_pads_actuation       # Actuate rotary pads in reverse~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ParallelSpinPadsGripperCommandGoal)))
  "Returns full string definition for message of type 'ParallelSpinPadsGripperCommandGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# When performing an action that uses the parallel jaw and the pads at the same time,~%# The parallel jaw one will be done first.~%# GOAL~%float64 par_target_pos  # Parallel gripper target aperture (in meters)~%float64 par_max_effort  # Parallel gripper motor max motor current~%float64 par_velocity    # Parallel gripper motor velocity~%bool actuate_parallel   # Whether to actuate the parallel gripper or not~%float64 pads_target_pos # Fingertip pads target angular position (in radians)~%float64 pads_max_effort # Fingertip pads motor max current (in mA)~%float64 pads_velocity   # Fingertip pads motor target velocity~%bool actuate_pads       # Whether to actuate the rotary pads or not~%bool reverse_pads_actuation       # Actuate rotary pads in reverse~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ParallelSpinPadsGripperCommandGoal>))
  (cl:+ 0
     8
     8
     8
     1
     8
     8
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ParallelSpinPadsGripperCommandGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'ParallelSpinPadsGripperCommandGoal
    (cl:cons ':par_target_pos (par_target_pos msg))
    (cl:cons ':par_max_effort (par_max_effort msg))
    (cl:cons ':par_velocity (par_velocity msg))
    (cl:cons ':actuate_parallel (actuate_parallel msg))
    (cl:cons ':pads_target_pos (pads_target_pos msg))
    (cl:cons ':pads_max_effort (pads_max_effort msg))
    (cl:cons ':pads_velocity (pads_velocity msg))
    (cl:cons ':actuate_pads (actuate_pads msg))
    (cl:cons ':reverse_pads_actuation (reverse_pads_actuation msg))
))
