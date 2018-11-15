(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n)
  (expt 2 (- n 1)))

(defun total ()
  (apply #'+
         (loop
            for x from 1
            below 8
            collect (square x))))
