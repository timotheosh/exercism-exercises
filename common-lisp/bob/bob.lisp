(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun shout-p (phrase)
  (unless  (string= (remove-if #'alpha-char-p phrase)
                    phrase)
    (string= phrase
             (string-upcase phrase))))

(defun question-p (phrase)
  (string= "?"
           (subseq phrase (- (length phrase) 1))))

(defun panicked-p (phrase)
  (and (shout-p phrase)
       (question-p phrase)))

(defun nevermind-p (phrase)
  (zerop (length phrase)))

(defun response-for (input)
  (let ((phrase (string-trim '(#\Space #\Tab #\Newline #\Page) input)))
    (cond ((nevermind-p phrase)       "Fine. Be that way!")
          ((panicked-p phrase)        "Calm down, I know what I'm doing!")
          ((shout-p phrase)           "Whoa, chill out!")
          ((question-p phrase)        "Sure.")
          (t                          "Whatever."))))
