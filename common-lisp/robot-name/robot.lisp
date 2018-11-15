(in-package #:cl-user)
(defpackage #:robot
  (:use #:common-lisp)
  (:export #:build-robot #:robot-name #:reset-name))

(in-package #:robot)

(defparameter *created-robots* '())

(defparameter *alphabet* '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))

(defun build-robot ()
  (let ((name (format nil "~A~A~A~A~A"
                      (elt *alphabet* (random 26)) (elt *alphabet* (random 26))
                      (random 10)
                      (random 10)
                      (random 10))))
    (if (search name *created-robots*)
        (build-robot)
        (progn
          (setf *created-robots* (cons name *created-robots*))
          name))))

(defun robot-name (robot)
  (when (member robot *created-robots*)
    robot))

(defun reset-name (robot)
  (setf *created-robots* (remove robot *created-robots*))
  (build-robot))
