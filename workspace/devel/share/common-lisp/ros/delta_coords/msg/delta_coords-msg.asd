
(cl:in-package :asdf)

(defsystem "delta_coords-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SendCoordsAction" :depends-on ("_package_SendCoordsAction"))
    (:file "_package_SendCoordsAction" :depends-on ("_package"))
    (:file "SendCoordsActionFeedback" :depends-on ("_package_SendCoordsActionFeedback"))
    (:file "_package_SendCoordsActionFeedback" :depends-on ("_package"))
    (:file "SendCoordsActionGoal" :depends-on ("_package_SendCoordsActionGoal"))
    (:file "_package_SendCoordsActionGoal" :depends-on ("_package"))
    (:file "SendCoordsActionResult" :depends-on ("_package_SendCoordsActionResult"))
    (:file "_package_SendCoordsActionResult" :depends-on ("_package"))
    (:file "SendCoordsFeedback" :depends-on ("_package_SendCoordsFeedback"))
    (:file "_package_SendCoordsFeedback" :depends-on ("_package"))
    (:file "SendCoordsGoal" :depends-on ("_package_SendCoordsGoal"))
    (:file "_package_SendCoordsGoal" :depends-on ("_package"))
    (:file "SendCoordsResult" :depends-on ("_package_SendCoordsResult"))
    (:file "_package_SendCoordsResult" :depends-on ("_package"))
  ))