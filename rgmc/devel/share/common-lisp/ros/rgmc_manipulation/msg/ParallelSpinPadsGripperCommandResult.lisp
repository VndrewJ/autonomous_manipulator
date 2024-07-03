; Auto-generated. Do not edit!


(cl:in-package rgmc_manipulation-msg)


;//! \htmlinclude ParallelSpinPadsGripperCommandResult.msg.html

(cl:defclass <ParallelSpinPadsGripperCommandResult> (roslisp-msg-protocol:ros-message)
  ((par_final_position
    :reader par_final_position
    :initarg :par_final_position
    :type cl:float
    :initform 0.0)
   (par_final_effort
    :reader par_final_effort
    :initarg :par_final_effort
    :type cl:float
    :initform 0.0)
   (par_stalled
    :reader par_stalled
    :initarg :par_stalled
    :type cl:boolean
    :initform cl:nil)
   (par_reached_goal
    :reader par_reached_goal
    :initarg :par_reached_goal
    :type cl:boolean
    :initform cl:nil)
   (pads_final_position
    :reader pads_final_position
    :initarg :pads_final_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pads_final_effort
    :reader pads_final_effort
    :initarg :pads_final_effort
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pads_stalled
    :reader pads_stalled
    :initarg :pads_stalled
    :type cl:boolean
    :initform cl:nil)
   (pads_reached_goal
    :reader pads_reached_goal
    :initarg :pads_reached_goal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ParallelSpinPadsGripperCommandResult (<ParallelSpinPadsGripperCommandResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ParallelSpinPadsGripperCommandResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ParallelSpinPadsGripperCommandResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgmc_manipulation-msg:<ParallelSpinPadsGripperCommandResult> is deprecated: use rgmc_manipulation-msg:ParallelSpinPadsGripperCommandResult instead.")))

(cl:ensure-generic-function 'par_final_position-val :lambda-list '(m))
(cl:defmethod par_final_position-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_final_position-val is deprecated.  Use rgmc_manipulation-msg:par_final_position instead.")
  (par_final_position m))

(cl:ensure-generic-function 'par_final_effort-val :lambda-list '(m))
(cl:defmethod par_final_effort-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_final_effort-val is deprecated.  Use rgmc_manipulation-msg:par_final_effort instead.")
  (par_final_effort m))

(cl:ensure-generic-function 'par_stalled-val :lambda-list '(m))
(cl:defmethod par_stalled-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_stalled-val is deprecated.  Use rgmc_manipulation-msg:par_stalled instead.")
  (par_stalled m))

(cl:ensure-generic-function 'par_reached_goal-val :lambda-list '(m))
(cl:defmethod par_reached_goal-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_reached_goal-val is deprecated.  Use rgmc_manipulation-msg:par_reached_goal instead.")
  (par_reached_goal m))

(cl:ensure-generic-function 'pads_final_position-val :lambda-list '(m))
(cl:defmethod pads_final_position-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_final_position-val is deprecated.  Use rgmc_manipulation-msg:pads_final_position instead.")
  (pads_final_position m))

(cl:ensure-generic-function 'pads_final_effort-val :lambda-list '(m))
(cl:defmethod pads_final_effort-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_final_effort-val is deprecated.  Use rgmc_manipulation-msg:pads_final_effort instead.")
  (pads_final_effort m))

(cl:ensure-generic-function 'pads_stalled-val :lambda-list '(m))
(cl:defmethod pads_stalled-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_stalled-val is deprecated.  Use rgmc_manipulation-msg:pads_stalled instead.")
  (pads_stalled m))

(cl:ensure-generic-function 'pads_reached_goal-val :lambda-list '(m))
(cl:defmethod pads_reached_goal-val ((m <ParallelSpinPadsGripperCommandResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_reached_goal-val is deprecated.  Use rgmc_manipulation-msg:pads_reached_goal instead.")
  (pads_reached_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ParallelSpinPadsGripperCommandResult>) ostream)
  "Serializes a message object of type '<ParallelSpinPadsGripperCommandResult>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_final_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_final_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'par_stalled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'par_reached_goal) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pads_final_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'pads_final_position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pads_final_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'pads_final_effort))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pads_stalled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pads_reached_goal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ParallelSpinPadsGripperCommandResult>) istream)
  "Deserializes a message object of type '<ParallelSpinPadsGripperCommandResult>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_final_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_final_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'par_stalled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'par_reached_goal) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pads_final_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pads_final_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pads_final_effort) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pads_final_effort)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:setf (cl:slot-value msg 'pads_stalled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pads_reached_goal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ParallelSpinPadsGripperCommandResult>)))
  "Returns string type for a message object of type '<ParallelSpinPadsGripperCommandResult>"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ParallelSpinPadsGripperCommandResult)))
  "Returns string type for a message object of type 'ParallelSpinPadsGripperCommandResult"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ParallelSpinPadsGripperCommandResult>)))
  "Returns md5sum for a message object of type '<ParallelSpinPadsGripperCommandResult>"
  "e170c820e7fe9881bd93a13cfc59ebbe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ParallelSpinPadsGripperCommandResult)))
  "Returns md5sum for a message object of type 'ParallelSpinPadsGripperCommandResult"
  "e170c820e7fe9881bd93a13cfc59ebbe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ParallelSpinPadsGripperCommandResult>)))
  "Returns full string definition for message of type '<ParallelSpinPadsGripperCommandResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# RESULT~%float64 par_final_position  # The final parallel gripper gap size (in meters)~%float64 par_final_effort    # The final parallel gripper effort exerted (motor current)~%bool par_stalled      # True iff the gripper is exerting max effort and not moving~%bool par_reached_goal # True iff the gripper position has reached the commanded setpoint~%float64[] pads_final_position # The final fingertip pads angular position (in radians)~%float64[] pads_final_effort   # The final fingertip pads effort (in mA)~%bool pads_stalled      # True iff one of the pads is exerting max effort and not moving~%bool pads_reached_goal # True iff both pads reached goal position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ParallelSpinPadsGripperCommandResult)))
  "Returns full string definition for message of type 'ParallelSpinPadsGripperCommandResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# RESULT~%float64 par_final_position  # The final parallel gripper gap size (in meters)~%float64 par_final_effort    # The final parallel gripper effort exerted (motor current)~%bool par_stalled      # True iff the gripper is exerting max effort and not moving~%bool par_reached_goal # True iff the gripper position has reached the commanded setpoint~%float64[] pads_final_position # The final fingertip pads angular position (in radians)~%float64[] pads_final_effort   # The final fingertip pads effort (in mA)~%bool pads_stalled      # True iff one of the pads is exerting max effort and not moving~%bool pads_reached_goal # True iff both pads reached goal position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ParallelSpinPadsGripperCommandResult>))
  (cl:+ 0
     8
     8
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pads_final_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pads_final_effort) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ParallelSpinPadsGripperCommandResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ParallelSpinPadsGripperCommandResult
    (cl:cons ':par_final_position (par_final_position msg))
    (cl:cons ':par_final_effort (par_final_effort msg))
    (cl:cons ':par_stalled (par_stalled msg))
    (cl:cons ':par_reached_goal (par_reached_goal msg))
    (cl:cons ':pads_final_position (pads_final_position msg))
    (cl:cons ':pads_final_effort (pads_final_effort msg))
    (cl:cons ':pads_stalled (pads_stalled msg))
    (cl:cons ':pads_reached_goal (pads_reached_goal msg))
))
