;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:


(provide 'two-fer)

(defun two-fer (&optional name)
  (unless name
    (setq name "you"))
  (concat "One for " name ", one for me."))

;;; two-fer.el ends here
