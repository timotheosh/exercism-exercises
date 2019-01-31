(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun delimiterp (c)
  "Default delimiters for splitting strings into a list of words."
  (not (alphanumericp c)))

(defun string-split (string &key (delimiterp #'delimiterp))
  "Converts a string into a list of words."
  (assert (stringp string))
  (loop :for beg = (position-if-not delimiterp string)
     :then (position-if-not delimiterp string :start (1+ end))
     :for end = (and beg (position-if delimiterp string :start beg))
     :when beg :collect (subseq string beg end)
     :while end))

(defun word-count (str)
  "Gives a word count from a string."
  (let ((wc '())
        (lst (string-split (string-downcase str))))
    (dolist (x lst)
      (let ((new-value (or (rest (assoc x wc :test 'string=))
                           0)))
        (when (> new-value 0)
          (setf wc (remove (assoc x wc :test 'string=) wc)))
        (push (cons x (incf new-value)) wc)))
    wc))
