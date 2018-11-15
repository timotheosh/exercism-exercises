(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun delimiterp (c)
  (or (char= c #\Space)
      (char= c #\-)))

(defun string-split (string &key (delimiterp #'delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
     :then (position-if-not delimiterp string :start (1+ end))
     :for end = (and beg (position-if delimiterp string :start beg))
     :when beg :collect (subseq string beg end)
     :while end))

(defun get-first-char (str)
  (string-upcase (subseq str 0 1)))

(defun acronym (str)
  (let ((seq (mapcar #'get-first-char (string-split str))))
    (with-output-to-string (s)
      (mapcar (lambda (x) (format s "~a" x)) seq))))
