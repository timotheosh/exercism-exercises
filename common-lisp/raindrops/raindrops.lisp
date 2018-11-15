(defpackage #:raindrops
  (:use #:common-lisp)
  (:export #:convert))

(in-package #:raindrops)

(defun factors (num &optional (fac1 1) (fac2 num))
  "Returns a list of all the factors of num, starting with fac1."
  (cond ((>= fac1 fac2) nil)
        ((zerop (mod num fac1))
         (let ((x (+ fac1 1))
               (y (/ num fac1)))
           (if (= fac1 y)
               (list fac1)
               (cons fac1
                     (cons y
                           (factors num x y))))))
        (t (factors num (+ fac1 1) fac2))))

(defun my-convert (num)
  (let ((ret
         (format nil "~{~a~}"
                 (loop
                    for x in (sort (factors num) #'<)
                    collect
                      (cond ((= x 3) "Pling")
                            ((= x 5) "Plang")
                            ((= x 7) "Plong")
                            (t ""))))))
    (if (zerop (length ret))
        (format nil "~a" num)
        ret)))

(defun convert (num)
  (let ((output ""))
    (when (zerop (mod num 3))
      (setf output (concatenate 'string output "Pling")))
    (when (zerop (mod num 5))
      (setf output (concatenate 'string output "Plang")))
    (when (zerop (mod num 7))
      (setf output (concatenate 'string output "Plong")))
    (if (string= output "")
        (format nil "~d" num)
        output)))
