;; Auto-generated. Do not edit!


(when (boundp 'delta_coords::Test)
  (if (not (find-package "DELTA_COORDS"))
    (make-package "DELTA_COORDS"))
  (shadow 'Test (find-package "DELTA_COORDS")))
(unless (find-package "DELTA_COORDS::TEST")
  (make-package "DELTA_COORDS::TEST"))
(unless (find-package "DELTA_COORDS::TESTREQUEST")
  (make-package "DELTA_COORDS::TESTREQUEST"))
(unless (find-package "DELTA_COORDS::TESTRESPONSE")
  (make-package "DELTA_COORDS::TESTRESPONSE"))

(in-package "ROS")





(defclass delta_coords::TestRequest
  :super ros::object
  :slots (_input ))

(defmethod delta_coords::TestRequest
  (:init
   (&key
    ((:input __input) "")
    )
   (send-super :init)
   (setq _input (string __input))
   self)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; string _input
    4 (length _input)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input
       (write-long (length _input) s) (princ _input s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_coords::TestResponse
  :super ros::object
  :slots (_output ))

(defmethod delta_coords::TestResponse
  (:init
   (&key
    ((:output __output) "")
    )
   (send-super :init)
   (setq _output (string __output))
   self)
  (:output
   (&optional __output)
   (if __output (setq _output __output)) _output)
  (:serialization-length
   ()
   (+
    ;; string _output
    4 (length _output)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _output
       (write-long (length _output) s) (princ _output s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _output
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _output (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_coords::Test
  :super ros::object
  :slots ())

(setf (get delta_coords::Test :md5sum-) "c63e85f503b805d84df783e71c6bb0d2")
(setf (get delta_coords::Test :datatype-) "delta_coords/Test")
(setf (get delta_coords::Test :request) delta_coords::TestRequest)
(setf (get delta_coords::Test :response) delta_coords::TestResponse)

(defmethod delta_coords::TestRequest
  (:response () (instance delta_coords::TestResponse :init)))

(setf (get delta_coords::TestRequest :md5sum-) "c63e85f503b805d84df783e71c6bb0d2")
(setf (get delta_coords::TestRequest :datatype-) "delta_coords/TestRequest")
(setf (get delta_coords::TestRequest :definition-)
      "string input
---
string output

")

(setf (get delta_coords::TestResponse :md5sum-) "c63e85f503b805d84df783e71c6bb0d2")
(setf (get delta_coords::TestResponse :datatype-) "delta_coords/TestResponse")
(setf (get delta_coords::TestResponse :definition-)
      "string input
---
string output

")



(provide :delta_coords/Test "c63e85f503b805d84df783e71c6bb0d2")


