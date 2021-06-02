;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'subr-x)

(defun empty-string-p (a-string)
  "Returns true if the string is empty or nil."
  (or (null a-string)
      (zerop (length (string-trim a-string)))))

(defun sort-string (a-string)
  (string-join
   (cl-remove-if 'empty-string-p
                 (cl-sort (split-string (downcase a-string) "")
                          'string-lessp))
   ""))

(defun anagrams-for (a-string a-list)
  (let ((new-str (sort-string a-string)))
    (cl-loop for word in a-list
             when (and (not (string= a-string word))
                       (string= new-str (sort-string word)))
             collect word)))

(provide 'anagram)
;;; anagram.el ends here
