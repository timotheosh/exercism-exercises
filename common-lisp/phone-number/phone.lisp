(in-package #:cl-user)
(defpackage #:phone
  (:use #:common-lisp)
  (:export #:numbers #:area-code #:pretty-print))

(in-package #:phone)

(defun numbers (number)
  (let* ((n (remove-if-not #'digit-char-p number))
         (num (if (and
                   (= (length n) 11)
                   (string= (subseq n 0 1) "1"))
                  (subseq n 1)
                  n)))
    (if (= (length num) 10)
        num
        "0000000000")))

(defun area-code (number)
  (subseq (numbers number) 0 3))

(defun pretty-print (number)
  (let ((num (numbers number)))
    (let ((acode (subseq num 0 3))
          (pref  (subseq num 3 6))
          (suff  (subseq num 6)))
      (format nil "(~a) ~a-~a" acode pref suff))))
