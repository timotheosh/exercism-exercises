(defpackage #:perfect-numbers
  (:use #:common-lisp)
  (:export #:classify))

(in-package #:perfect-numbers)

(defun sum-factors (n)
  (loop :for i :from 1 :to (/ n 2)
     :when (zerop (mod n i)) :sum i))


(defun classify (n)
  (when (> n 0)
    (let ((sum (sum-factors n)))
      (cond ((= sum n) "perfect")
            ((> sum n) "abundant")
            (t "deficient")))))
