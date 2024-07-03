;; Auto-generated. Do not edit!


(when (boundp 'rgmc_manipulation::ParallelSpinPadsGripperCommandResult)
  (if (not (find-package "RGMC_MANIPULATION"))
    (make-package "RGMC_MANIPULATION"))
  (shadow 'ParallelSpinPadsGripperCommandResult (find-package "RGMC_MANIPULATION")))
(unless (find-package "RGMC_MANIPULATION::PARALLELSPINPADSGRIPPERCOMMANDRESULT")
  (make-package "RGMC_MANIPULATION::PARALLELSPINPADSGRIPPERCOMMANDRESULT"))

(in-package "ROS")
;;//! \htmlinclude ParallelSpinPadsGripperCommandResult.msg.html


(defclass rgmc_manipulation::ParallelSpinPadsGripperCommandResult
  :super ros::object
  :slots (_par_final_position _par_final_effort _par_stalled _par_reached_goal _pads_final_position _pads_final_effort _pads_stalled _pads_reached_goal ))

(defmethod rgmc_manipulation::ParallelSpinPadsGripperCommandResult
  (:init
   (&key
    ((:par_final_position __par_final_position) 0.0)
    ((:par_final_effort __par_final_effort) 0.0)
    ((:par_stalled __par_stalled) nil)
    ((:par_reached_goal __par_reached_goal) nil)
    ((:pads_final_position __pads_final_position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pads_final_effort __pads_final_effort) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pads_stalled __pads_stalled) nil)
    ((:pads_reached_goal __pads_reached_goal) nil)
    )
   (send-super :init)
   (setq _par_final_position (float __par_final_position))
   (setq _par_final_effort (float __par_final_effort))
   (setq _par_stalled __par_stalled)
   (setq _par_reached_goal __par_reached_goal)
   (setq _pads_final_position __pads_final_position)
   (setq _pads_final_effort __pads_final_effort)
   (setq _pads_stalled __pads_stalled)
   (setq _pads_reached_goal __pads_reached_goal)
   self)
  (:par_final_position
   (&optional __par_final_position)
   (if __par_final_position (setq _par_final_position __par_final_position)) _par_final_position)
  (:par_final_effort
   (&optional __par_final_effort)
   (if __par_final_effort (setq _par_final_effort __par_final_effort)) _par_final_effort)
  (:par_stalled
   (&optional (__par_stalled :null))
   (if (not (eq __par_stalled :null)) (setq _par_stalled __par_stalled)) _par_stalled)
  (:par_reached_goal
   (&optional (__par_reached_goal :null))
   (if (not (eq __par_reached_goal :null)) (setq _par_reached_goal __par_reached_goal)) _par_reached_goal)
  (:pads_final_position
   (&optional __pads_final_position)
   (if __pads_final_position (setq _pads_final_position __pads_final_position)) _pads_final_position)
  (:pads_final_effort
   (&optional __pads_final_effort)
   (if __pads_final_effort (setq _pads_final_effort __pads_final_effort)) _pads_final_effort)
  (:pads_stalled
   (&optional (__pads_stalled :null))
   (if (not (eq __pads_stalled :null)) (setq _pads_stalled __pads_stalled)) _pads_stalled)
  (:pads_reached_goal
   (&optional (__pads_reached_goal :null))
   (if (not (eq __pads_reached_goal :null)) (setq _pads_reached_goal __pads_reached_goal)) _pads_reached_goal)
  (:serialization-length
   ()
   (+
    ;; float64 _par_final_position
    8
    ;; float64 _par_final_effort
    8
    ;; bool _par_stalled
    1
    ;; bool _par_reached_goal
    1
    ;; float64[] _pads_final_position
    (* 8    (length _pads_final_position)) 4
    ;; float64[] _pads_final_effort
    (* 8    (length _pads_final_effort)) 4
    ;; bool _pads_stalled
    1
    ;; bool _pads_reached_goal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _par_final_position
       (sys::poke _par_final_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _par_final_effort
       (sys::poke _par_final_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _par_stalled
       (if _par_stalled (write-byte -1 s) (write-byte 0 s))
     ;; bool _par_reached_goal
       (if _par_reached_goal (write-byte -1 s) (write-byte 0 s))
     ;; float64[] _pads_final_position
     (write-long (length _pads_final_position) s)
     (dotimes (i (length _pads_final_position))
       (sys::poke (elt _pads_final_position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pads_final_effort
     (write-long (length _pads_final_effort) s)
     (dotimes (i (length _pads_final_effort))
       (sys::poke (elt _pads_final_effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _pads_stalled
       (if _pads_stalled (write-byte -1 s) (write-byte 0 s))
     ;; bool _pads_reached_goal
       (if _pads_reached_goal (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _par_final_position
     (setq _par_final_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _par_final_effort
     (setq _par_final_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _par_stalled
     (setq _par_stalled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _par_reached_goal
     (setq _par_reached_goal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64[] _pads_final_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pads_final_position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pads_final_position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pads_final_effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pads_final_effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pads_final_effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _pads_stalled
     (setq _pads_stalled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _pads_reached_goal
     (setq _pads_reached_goal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandResult :md5sum-) "e170c820e7fe9881bd93a13cfc59ebbe")
(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandResult :datatype-) "rgmc_manipulation/ParallelSpinPadsGripperCommandResult")
(setf (get rgmc_manipulation::ParallelSpinPadsGripperCommandResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# RESULT
float64 par_final_position  # The final parallel gripper gap size (in meters)
float64 par_final_effort    # The final parallel gripper effort exerted (motor current)
bool par_stalled      # True iff the gripper is exerting max effort and not moving
bool par_reached_goal # True iff the gripper position has reached the commanded setpoint
float64[] pads_final_position # The final fingertip pads angular position (in radians)
float64[] pads_final_effort   # The final fingertip pads effort (in mA)
bool pads_stalled      # True iff one of the pads is exerting max effort and not moving
bool pads_reached_goal # True iff both pads reached goal position

")



(provide :rgmc_manipulation/ParallelSpinPadsGripperCommandResult "e170c820e7fe9881bd93a13cfc59ebbe")


