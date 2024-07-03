; Auto-generated. Do not edit!


(cl:in-package rgmc_manipulation-msg)


;//! \htmlinclude ParallelSpinPadsGripperCommandFeedback.msg.html

(cl:defclass <ParallelSpinPadsGripperCommandFeedback> (roslisp-msg-protocol:ros-message)
  ((par_position
    :reader par_position
    :initarg :par_position
    :type cl:float
    :initform 0.0)
   (par_effort
    :reader par_effort
    :initarg :par_effort
    :type cl:float
    :initform 0.0)
   (pads_position
    :reader pads_position
    :initarg :pads_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pads_effort
    :reader pads_effort
    :initarg :pads_effort
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ParallelSpinPadsGripperCommandFeedback (<ParallelSpinPadsGripperCommandFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ParallelSpinPadsGripperCommandFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ParallelSpinPadsGripperCommandFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgmc_manipulation-msg:<ParallelSpinPadsGripperCommandFeedback> is deprecated: use rgmc_manipulation-msg:ParallelSpinPadsGripperCommandFeedback instead.")))

(cl:ensure-generic-function 'par_position-val :lambda-list '(m))
(cl:defmethod par_position-val ((m <ParallelSpinPadsGripperCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_position-val is deprecated.  Use rgmc_manipulation-msg:par_position instead.")
  (par_position m))

(cl:ensure-generic-function 'par_effort-val :lambda-list '(m))
(cl:defmethod par_effort-val ((m <ParallelSpinPadsGripperCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:par_effort-val is deprecated.  Use rgmc_manipulation-msg:par_effort instead.")
  (par_effort m))

(cl:ensure-generic-function 'pads_position-val :lambda-list '(m))
(cl:defmethod pads_position-val ((m <ParallelSpinPadsGripperCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_position-val is deprecated.  Use rgmc_manipulation-msg:pads_position instead.")
  (pads_position m))

(cl:ensure-generic-function 'pads_effort-val :lambda-list '(m))
(cl:defmethod pads_effort-val ((m <ParallelSpinPadsGripperCommandFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgmc_manipulation-msg:pads_effort-val is deprecated.  Use rgmc_manipulation-msg:pads_effort instead.")
  (pads_effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ParallelSpinPadsGripperCommandFeedback>) ostream)
  "Serializes a message object of type '<ParallelSpinPadsGripperCommandFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'par_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pads_position))))
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
   (cl:slot-value msg 'pads_position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pads_effort))))
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
   (cl:slot-value msg 'pads_effort))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ParallelSpinPadsGripperCommandFeedback>) istream)
  "Deserializes a message object of type '<ParallelSpinPadsGripperCommandFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'par_effort) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pads_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pads_position)))
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
  (cl:setf (cl:slot-value msg 'pads_effort) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pads_effort)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ParallelSpinPadsGripperCommandFeedback>)))
  "Returns string type for a message object of type '<ParallelSpinPadsGripperCommandFeedback>"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ParallelSpinPadsGripperCommandFeedback)))
  "Returns string type for a message object of type 'ParallelSpinPadsGripperCommandFeedback"
  "rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ParallelSpinPadsGripperCommandFeedback>)))
  "Returns md5sum for a message object of type '<ParallelSpinPadsGripperCommandFeedback>"
  "2806a1e58dffdfdf7bed2a77162778b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ParallelSpinPadsGripperCommandFeedback)))
  "Returns md5sum for a message object of type 'ParallelSpinPadsGripperCommandFeedback"
  "2806a1e58dffdfdf7bed2a77162778b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ParallelSpinPadsGripperCommandFeedback>)))
  "Returns full string definition for message of type '<ParallelSpinPadsGripperCommandFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# FEEDBACK~%float64 par_position  # The current parallel gripper gap size (in meters)~%float64 par_effort    # The current parallel gripper effort exerted (motor current)~%float64[] pads_position # The current fingertip pads angular position (in radians)~%float64[] pads_effort   # The current fingertip pads effort (in mA)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ParallelSpinPadsGripperCommandFeedback)))
  "Returns full string definition for message of type 'ParallelSpinPadsGripperCommandFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# FEEDBACK~%float64 par_position  # The current parallel gripper gap size (in meters)~%float64 par_effort    # The current parallel gripper effort exerted (motor current)~%float64[] pads_position # The current fingertip pads angular position (in radians)~%float64[] pads_effort   # The current fingertip pads effort (in mA)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ParallelSpinPadsGripperCommandFeedback>))
  (cl:+ 0
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pads_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pads_effort) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ParallelSpinPadsGripperCommandFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'ParallelSpinPadsGripperCommandFeedback
    (cl:cons ':par_position (par_position msg))
    (cl:cons ':par_effort (par_effort msg))
    (cl:cons ':pads_position (pads_position msg))
    (cl:cons ':pads_effort (pads_effort msg))
))
