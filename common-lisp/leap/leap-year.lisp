(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  (flet ((year-divisible-by (n)
           (zerop (mod year n))))
    (and (year-divisible-by 4)
         (or (not (year-divisible-by 100))
             (year-divisible-by 400)))))
