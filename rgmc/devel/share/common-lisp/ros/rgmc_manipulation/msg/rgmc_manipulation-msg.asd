
(cl:in-package :asdf)

(defsystem "rgmc_manipulation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ParallelSpinPadsGripperCommandAction" :depends-on ("_package_ParallelSpinPadsGripperCommandAction"))
    (:file "_package_ParallelSpinPadsGripperCommandAction" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandActionFeedback" :depends-on ("_package_ParallelSpinPadsGripperCommandActionFeedback"))
    (:file "_package_ParallelSpinPadsGripperCommandActionFeedback" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandActionGoal" :depends-on ("_package_ParallelSpinPadsGripperCommandActionGoal"))
    (:file "_package_ParallelSpinPadsGripperCommandActionGoal" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandActionResult" :depends-on ("_package_ParallelSpinPadsGripperCommandActionResult"))
    (:file "_package_ParallelSpinPadsGripperCommandActionResult" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandFeedback" :depends-on ("_package_ParallelSpinPadsGripperCommandFeedback"))
    (:file "_package_ParallelSpinPadsGripperCommandFeedback" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandGoal" :depends-on ("_package_ParallelSpinPadsGripperCommandGoal"))
    (:file "_package_ParallelSpinPadsGripperCommandGoal" :depends-on ("_package"))
    (:file "ParallelSpinPadsGripperCommandResult" :depends-on ("_package_ParallelSpinPadsGripperCommandResult"))
    (:file "_package_ParallelSpinPadsGripperCommandResult" :depends-on ("_package"))
  ))