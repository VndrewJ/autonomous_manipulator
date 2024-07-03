;; Auto-generated. Do not edit!


(when (boundp 'rgmc_manipulation::NFSRequest)
  (if (not (find-package "RGMC_MANIPULATION"))
    (make-package "RGMC_MANIPULATION"))
  (shadow 'NFSRequest (find-package "RGMC_MANIPULATION")))
(unless (find-package "RGMC_MANIPULATION::NFSREQUEST")
  (make-package "RGMC_MANIPULATION::NFSREQUEST"))
(unless (find-package "RGMC_MANIPULATION::NFSREQUESTREQUEST")
  (make-package "RGMC_MANIPULATION::NFSREQUESTREQUEST"))
(unless (find-package "RGMC_MANIPULATION::NFSREQUESTRESPONSE")
  (make-package "RGMC_MANIPULATION::NFSREQUESTRESPONSE"))

(in-package "ROS")





(defclass rgmc_manipulation::NFSRequestRequest
  :super ros::object
  :slots (_target_vel _target_torque _set_motor_state _move _stop _clear_error ))

(defmethod rgmc_manipulation::NFSRequestRequest
  (:init
   (&key
    ((:target_vel __target_vel) 0.0)
    ((:target_torque __target_torque) 0.0)
    ((:set_motor_state __set_motor_state) nil)
    ((:move __move) nil)
    ((:stop __stop) nil)
    ((:clear_error __clear_error) nil)
    )
   (send-super :init)
   (setq _target_vel (float __target_vel))
   (setq _target_torque (float __target_torque))
   (setq _set_motor_state __set_motor_state)
   (setq _move __move)
   (setq _stop __stop)
   (setq _clear_error __clear_error)
   self)
  (:target_vel
   (&optional __target_vel)
   (if __target_vel (setq _target_vel __target_vel)) _target_vel)
  (:target_torque
   (&optional __target_torque)
   (if __target_torque (setq _target_torque __target_torque)) _target_torque)
  (:set_motor_state
   (&optional (__set_motor_state :null))
   (if (not (eq __set_motor_state :null)) (setq _set_motor_state __set_motor_state)) _set_motor_state)
  (:move
   (&optional (__move :null))
   (if (not (eq __move :null)) (setq _move __move)) _move)
  (:stop
   (&optional (__stop :null))
   (if (not (eq __stop :null)) (setq _stop __stop)) _stop)
  (:clear_error
   (&optional (__clear_error :null))
   (if (not (eq __clear_error :null)) (setq _clear_error __clear_error)) _clear_error)
  (:serialization-length
   ()
   (+
    ;; float64 _target_vel
    8
    ;; float64 _target_torque
    8
    ;; bool _set_motor_state
    1
    ;; bool _move
    1
    ;; bool _stop
    1
    ;; bool _clear_error
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _target_vel
       (sys::poke _target_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _target_torque
       (sys::poke _target_torque (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _set_motor_state
       (if _set_motor_state (write-byte -1 s) (write-byte 0 s))
     ;; bool _move
       (if _move (write-byte -1 s) (write-byte 0 s))
     ;; bool _stop
       (if _stop (write-byte -1 s) (write-byte 0 s))
     ;; bool _clear_error
       (if _clear_error (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _target_vel
     (setq _target_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _target_torque
     (setq _target_torque (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _set_motor_state
     (setq _set_motor_state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _move
     (setq _move (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _stop
     (setq _stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _clear_error
     (setq _clear_error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rgmc_manipulation::NFSRequestResponse
  :super ros::object
  :slots (_result ))

(defmethod rgmc_manipulation::NFSRequestResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rgmc_manipulation::NFSRequest
  :super ros::object
  :slots ())

(setf (get rgmc_manipulation::NFSRequest :md5sum-) "1297a10f19670677860ac0dedc54bb5d")
(setf (get rgmc_manipulation::NFSRequest :datatype-) "rgmc_manipulation/NFSRequest")
(setf (get rgmc_manipulation::NFSRequest :request) rgmc_manipulation::NFSRequestRequest)
(setf (get rgmc_manipulation::NFSRequest :response) rgmc_manipulation::NFSRequestResponse)

(defmethod rgmc_manipulation::NFSRequestRequest
  (:response () (instance rgmc_manipulation::NFSRequestResponse :init)))

(setf (get rgmc_manipulation::NFSRequestRequest :md5sum-) "1297a10f19670677860ac0dedc54bb5d")
(setf (get rgmc_manipulation::NFSRequestRequest :datatype-) "rgmc_manipulation/NFSRequestRequest")
(setf (get rgmc_manipulation::NFSRequestRequest :definition-)
      "float64 target_vel
float64 target_torque
bool set_motor_state
bool move
bool stop
bool clear_error
---
bool result
")

(setf (get rgmc_manipulation::NFSRequestResponse :md5sum-) "1297a10f19670677860ac0dedc54bb5d")
(setf (get rgmc_manipulation::NFSRequestResponse :datatype-) "rgmc_manipulation/NFSRequestResponse")
(setf (get rgmc_manipulation::NFSRequestResponse :definition-)
      "float64 target_vel
float64 target_torque
bool set_motor_state
bool move
bool stop
bool clear_error
---
bool result
")



(provide :rgmc_manipulation/NFSRequest "1297a10f19670677860ac0dedc54bb5d")


