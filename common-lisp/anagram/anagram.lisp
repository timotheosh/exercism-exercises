(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-string (str)
  "Non-destructively sorts a string, case-insensitively."
  (sort (copy-seq str) #'char-lessp))

(defun anagrams-for (str lst)
  "Returns anagrams of a string, str, from the given list, lst."
  (declare (string str)
           (list lst))
  (let ((new-str (sort-string str)))
    (loop for x in lst
       when (and
             (string-not-equal x str)
             (string-equal (sort-string x) new-str))
       collect x)))
