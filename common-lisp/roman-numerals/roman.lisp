(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

(defun romanize (num)
  "Converts an integer to roman numerals."
  (declare (fixnum num))
  (assert (and (plusp num)
               (< num 4000)))
  (format nil "~@r" num))
