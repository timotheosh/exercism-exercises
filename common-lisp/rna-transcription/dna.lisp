(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun to-rna (strand)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string (lambda (x)
                 (case x
                   (#\G #\C)
                   (#\C #\G)
                   (#\T #\A)
                   (#\A #\U))) strand))
