;; Auto-generated. Do not edit!


(when (boundp 'rgmc_manipulation::ParallelSpinPadsGripperCommandGoal)
  (if (not (find-package "RGMC_MANIPULATION"))
    (make-package "RGMC_MANIPULATION"))
  (shadow 'ParallelSpinPadsGripperCommandGoal (find-package "RGMC_MANIPULATION")))
(unless (find-package "RGMC_MANIPULATION::PARALLELSPINPADSGRIPPERCOMMANDGOAL")
  (make-package "RGMC_MANIPULATION::PARALLELSPINPADSGRIPPERCOMMANDGOAL"))

(in-package "ROS")
;;//! \htmlinclude ParallelSpinPadsGripperCommandGoal.msg.html


(defclass rgmc_manipulation::ParallelSpinPadsGripperCommandGoal
  :super ros::object
  :slots (_par_target_pos _par_max_effort _par_velocity _actuate_parallel _pads_target_pos _pads_max_effort _pads_velocity _actuate_pads _reverse_pads_actuation ))

(defmethod rgmc_manipulation::ParallelSpinPadsGripperCommandGoal
  (:init
   (&key
    ((:par_target_pos __par_target_pos) 0.0)
    ((:par_max_effort __par_max_effort) 0.0)
    ((:par_velocity __par_velocity) 0.0)
    ((:actuate_parallel __actuate_parallel) nil)
    ((:pads_target_pos __pads_target_pos) 0.0)
    ((:pads_max_effort __pads_max_effort) 0.0)
    ((:pads_velocity __pads_velocity) 0.0)
    ((:actuate_pads __actuate_pads) nil)
    ((:reverse_pads_actuation __reverse_pads_actuation) nil)
    )
   (send-super :init)
   (setq _par_target_pos (float __par_target_pos))
   (setq _par_max_effort (float __par_max_effort))
   (setq _par_velocity (float __par_velocity))
   (setq _actuate_parallel __actuate_parallel)
   (setq _pads_target_pos (float __pads_target_pos))
   (setq _pads_max_effort (float __pads_max_effort))
   (setq _pads_velocity (float __pads_velocity))
   (setq _actuate_pads __actuate_pads)
   (setq _reverse_pads_actuation __reverse_pads_actuation)
   self)
  (:par_target_pos
   (&optional __par_target_pos)
   (if __par_target_pos (setq _par_target_pos __par_target_pos)) _par_target_pos)
  (:par_max_effort
   (&optional __par_max_effort)
   (if __par_max_effort (setq _par_max_effort __par_max_effort)) _par_max_effort)
  (:par_velocity
   (&optional __par_velocity)
   (if __par_velocity (setq _par_velocity __par_velocity)) _par_velocity)
  (:actuate_parallel
   (&optional (__actuate_parallel :null))
   (if (not (eq __actuate_parallel :null)) (setq _actuate_parallel __actuate_parallel)) _actuate_parallel)
  (:pads_target_pos
   (&optional __pads_target_pos)
   (if __pads_target_pos (setq _pads_target_pos __pads_target_pos)) _pads_target_pos)
  (:pads_max_effort
   (&optional __pads_max_effort)
   (if __pads_max_effort (setq _pads_max_effort __pads_max_effort)) _pads_max_effort)
  (:pads_velocity
   (&optional __pads_velocity)
   (if __pads_velocity (setq _pads_velocity __pads_velocity)) _pads_velocity)
  (:actuate_pads
   (&optional (__actuate_pads :null))
   (if (not (eq __actuate_pads :null)) (setq _actuate_pads __actuate_pads)) _actuate_pads)
  (:reverse_pads_actuation
   (&optional (__reverse_pads_actuation :null))
   (if (not (eq __reverse_pads_actuation :null)) (setq _reverse_pads_actuation __reverse_pads_actuation)) _reverse_pads_actuation)
  (:serialization-length
   ()
   (+
    ;; float64 _par_target_pos
    8
    ;; float64 _par_max_effort
    8
    ;; float64 _par_velocity
    8
    ;; bool _actuate_parallel
    1
    ;; float64 _pads_target_pos
    8
    ;; float64 _pads_max_effort
    8
    ;; float64 _pads_velocity
    8
    ;; bool _actuate_pads
    1
    ;; bool _reverse_pads_actuation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _par_target_pos
       (sys::poke _par_target_pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _par_max_effort
       (sys::poke _par_max_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _par_velocity
       (sys::poke _par_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _actuate_parallel
       (if _actuate_parallel (write-byte -1 s) (write-byte 0 s))
     ;; float64 _pads_target_pos
       (sys::poke _pads_target_pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pads_max_effort
       (sys::poke _pads_max_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pads_velocity
       (sys::poke _pads_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _actuate_pads
       (if _actuate_pads (write-byte -1 s) (write-byte 0 s))
     ;; bool _reverse_pads_actuation
       (if _reverse_pads_actuation (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _par_target_pos
     (setq _par_target_pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _par_max_effort
     (setq _par_max_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _par_velocity
     (setq _par_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _actuate_parallel
     (setq _actuate_parallel (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _pads_target_pos
     (setq _pads_target_pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pads_max_effort
     (setq _pads_max_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pads_velocity
     (setq _pads_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _actuate_pads
     (setq _actuate_pads (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _reverse_pads_actuation
     (setq _reverse_pads_actuation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandGoal :md5sum-) "cb68d13aae1dc06acb5bf6743e7c751f")
(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandGoal :datatype-) "rgmc_manipulation/ParallelSpinPadsGripperCommandGoal")
(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# When performing an action that uses the parallel jaw and the pads at the same time,
# The parallel jaw one will be done first.
# GOAL
float64 par_target_pos  # Parallel gripper target aperture (in meters)
float64 par_max_effort  # Parallel gripper motor max motor current
float64 par_velocity    # Parallel gripper motor velocity
bool actuate_parallel   # Whether to actuate the parallel gripper or not
float64 pads_target_pos # Fingertip pads target angular position (in radians)
float64 pads_max_effort # Fingertip pads motor max current (in mA)
float64 pads_velocity   # Fingertip pads motor target velocity
bool actuate_pads       # Whether to actuate the rotary pads or not
bool reverse_pads_actuation       # Actuate rotary pads in reverse

")



(provide :rgmc_manipulation/ParallelSpinPadsGripperCommandGoal "cb68d13aae1dc06acb5bf6743e7c751f")


