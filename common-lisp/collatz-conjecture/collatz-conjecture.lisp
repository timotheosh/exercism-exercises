(defpackage #:collatz-conjecture
  (:use #:common-lisp)
  (:export #:collatz))

(in-package #:collatz-conjecture)

(defun collatz (n &optional (c 0))
  (cond ((= n 1) c)
        ((< n 1) nil)
        ((evenp n) (collatz (/ n 2) (incf c)))
        ((oddp n) (collatz (+ (* n 3) 1) (incf c)))))
