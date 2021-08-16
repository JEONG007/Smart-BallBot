
(cl:in-package :asdf)

(defsystem "realsense_d435-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "objection" :depends-on ("_package_objection"))
    (:file "_package_objection" :depends-on ("_package"))
    (:file "objectionsofonemat" :depends-on ("_package_objectionsofonemat"))
    (:file "_package_objectionsofonemat" :depends-on ("_package"))
  ))