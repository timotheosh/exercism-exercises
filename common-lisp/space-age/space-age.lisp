(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars
           #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defparameter esec 31557600)

(defun on-earth (seconds)
  (/ seconds esec))

(defun on-mercury (seconds)
  (/ seconds (* esec 0.2408467)))

(defun on-venus (seconds)
  (/ seconds (* esec 0.61519726)))

(defun on-mars (seconds)
  (/ seconds (* esec 1.8808158)))

(defun on-jupiter (seconds)
  (/ seconds (* esec 11.862615)))

(defun on-saturn (seconds)
  (/ seconds (* esec 29.447498)))

(defun on-uranus (seconds)
  (/ seconds (* esec 84.016846)))

(defun on-neptune (seconds)
  (/ seconds (* esec 164.79132)))
