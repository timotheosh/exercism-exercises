;;; bob.el --- Bob exercise (exercism)

;;; Commentary:
;; Solution for the bob exercise at exercism.io

;;; Code:
;; Needed for some key string operations.
(require 'subr-x)

(defun is-silent-p (input)
  "Check if input represents silence."
  (zerop (length (string-trim input))))

(defun is-yelling-p (input)
  "Check for yelling."
  (and (string-match-p "[a-zA-Z]" input)
       (string-equal (upcase input) input)))

(defun is-question-p (input)
  "Check for question."
  (string-suffix-p "?" (string-trim input)))

(defun response-for (input)
  "Responses from Bob, a lackadaisical teenager."
  (cond ((and (is-yelling-p input)
              (is-question-p input)) "Calm down, I know what I'm doing!")
        ((is-yelling-p input)        "Whoa, chill out!")
        ((is-question-p input)       "Sure.")
        ((is-silent-p input)         "Fine. Be that way!")
        (t "Whatever.")))

(provide 'bob)
;;; bob.el ends here
