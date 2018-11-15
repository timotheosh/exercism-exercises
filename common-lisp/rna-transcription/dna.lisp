(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun string-to-list (str)
  (assert (stringp str) (str))
  (let ((s (string-upcase str)))
    (coerce s 'list)))

(defun list-to-string (lst)
  (assert (or (listp lst)
              (vectorp lst)) (lst))
  (coerce lst 'string))

(defun to-rna (strand)
  "Transcribe a string representing DNA nucleotides to RNA."
  (list-to-string
   (mapcar (lambda (x)
             (case x
               (#\G #\C)
               (#\C #\G)
               (#\T #\A)
               (#\A #\U))) (string-to-list strand))))
