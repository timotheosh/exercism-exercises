(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

;; The easy way
(defun romanize-easy (num)
  "Converts an integer to roman numerals."
  (declare (fixnum num))
  (assert (and (plusp num)
               (< num 4000)))
  (format nil "~@r" num))

;; The lil' more challenging way
(defun romanize-hard (number)
  (declare (fixnum number))
  (assert (< number 4000))
  (cond ((>= number 1000) (concatenate 'string "M" (romanize (- number 1000))))
        ((>= number 900) (concatenate 'string "CM" (romanize (- number 900))))
        ((>= number 500) (concatenate 'string "D" (romanize (- number 500))))
        ((>= number 400) (concatenate 'string "CD" (romanize (- number 400))))
        ((>= number 100) (concatenate 'string "C" (romanize (- number 100))))
        ((>= number 90) (concatenate 'string "XC" (romanize (- number 90))))
        ((>= number 50) (concatenate 'string "L" (romanize (- number 50))))
        ((>= number 40) (concatenate 'string "XL" (romanize (- number 40))))
        ((>= number 10) (concatenate 'string "X" (romanize (- number 10))))
        ((>= number 9) (concatenate 'string "IX" (romanize (- number 9))))
        ((>= number 5) (concatenate 'string "V" (romanize (- number 5))))
        ((>= number 4) (concatenate 'string "IV" (romanize (- number 4))))
        ((>= number 1) (concatenate 'string "I" (romanize (- number 1))))
        (t "")))

(defun romanize (number)
  (romanize-hard number))
