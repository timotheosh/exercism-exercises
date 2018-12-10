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
  (cond ((>= number 1000) (format nil "M~A" (romanize (- number 1000))))
        ((>= number 900) (format nil "CM~A" (romanize (- number 900))))
        ((>= number 500) (format nil "D~A" (romanize (- number 500))))
        ((>= number 400) (format nil "CD~A" (romanize (- number 400))))
        ((>= number 100) (format nil "C~A" (romanize (- number 100))))
        ((>= number 90) (format nil "XC~A" (romanize (- number 90))))
        ((>= number 50) (format nil "L~A" (romanize (- number 50))))
        ((>= number 40) (format nil "XL~A" (romanize (- number 40))))
        ((>= number 10) (format nil "X~A" (romanize (- number 10))))
        ((>= number 9) (format nil "IX~A" (romanize (- number 9))))
        ((>= number 5) (format nil "V~A" (romanize (- number 5))))
        ((>= number 4) (format nil "IV~A" (romanize (- number 4))))
        ((>= number 1) (format nil "I~A" (romanize (- number 1))))
        (t (format nil ""))))

(defun romanize (number)
  (romanize-hard number))
