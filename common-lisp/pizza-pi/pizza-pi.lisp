(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defconstant +pi+ (/ 22 7))

(defun dough-calculator (pizzas diameter)
  (multiple-value-bind (quotient remainder)
      (floor (* pizzas (+ 200 (/ (* 45 +pi+ diameter) 20))))
    quotient))

(defun size-from-sauce (sauce)
  (multiple-value-bind (quotient remainder)
      (fceiling
       (sqrt (/ (* 40 sauce) (* +pi+ 3)))
       0.01)
    (/ quotient 100.0)))

(defun pizzas-per-cube (cube-length diameter)
  (multiple-value-bind (quotient remainder)
      (floor
       (/ (* 2 (expt cube-length 3)) (* 3 +pi+ (expt diameter 2))))
    quotient))

(defun fair-share-p (pizzas friends)
  (zerop (mod (* 8 pizzas) friends)))
