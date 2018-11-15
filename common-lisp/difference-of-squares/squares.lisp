(defpackage #:squares
  (:use #:cl)
  (:export #:sum-of-squares
           #:square-of-sum
           #:difference))

(in-package #:squares)

;; Stolen from https://stackoverflow.com/questions/13937520/pythons-range-analog-in-common-lisp
(defun range (max &key (min 0) (step 1))
  (loop for n from min below max by step
     collect n))

(defun square-of-sum (num)
  (expt (apply #'+ (range (1+ num) :min 1)) 2))

(defun sum-of-squares (num)
  (apply #'+
         (mapcar (lambda (x) (expt x 2))
                 (range (1+ num) :min 1))))

(defun difference (num)
  (- (square-of-sum num) (sum-of-squares num)))
