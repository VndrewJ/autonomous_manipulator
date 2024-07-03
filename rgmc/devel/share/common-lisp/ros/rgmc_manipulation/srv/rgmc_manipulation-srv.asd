
(cl:in-package :asdf)

(defsystem "rgmc_manipulation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "NFSRequest" :depends-on ("_package_NFSRequest"))
    (:file "_package_NFSRequest" :depends-on ("_package"))
  ))