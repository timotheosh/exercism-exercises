(in-package #:cl-user)
(defpackage #:dna
  (:use #:common-lisp)
  (:export #:dna-count #:nucleotide-counts #:invalid-nucleotide))

(in-package #:dna)

(define-condition invalid-nucleotide (error)
  ((message :initarg :message :reader message)))

(defconstant +nucleotide+ '(#\A #\C #\G #\T))

(defun valid-nucleotide (ch)
  (if (member ch +nucleotide+)
      t
      (error 'invalid-nucleotide :message "invalid nucleotide")))

(defun dna-count (ch str)
  (when (valid-nucleotide ch)
    (let ((count 0))
      (loop for x across str
         do (when (char= ch x) (incf count)))
      count)))

(defun nucleotide-counts (str)
  (let ((str-count (make-hash-table)))
    (mapcar (lambda (x) (setf (gethash x str-count) 0)) +nucleotide+)
    (loop for x across str
       do (progn
            (when (valid-nucleotide x)
              (setf (gethash x str-count) (incf (gethash x str-count))))))
    str-count))
