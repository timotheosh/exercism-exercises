(in-package #:cl-user)
(defpackage #:etl
  (:use #:common-lisp)
  (:export #:transform))

(in-package #:etl)

(defun transform (data)
  (let ((new-system (make-hash-table :test 'equalp)))
    (maphash (lambda (key value)
               (dolist (x value)
                 (setf (gethash (string-downcase x) new-system) key)))
             data)
    new-system))
