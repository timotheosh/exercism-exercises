;;; leap.el --- Leap exercise (exercism)

;;; Commentary:
;; Returns t if given year is a leap year, else return nil

;;; Code:
(require 'cl-lib)

(defun leap-year-p (year)
  (cl-flet ((year-divisible-by (n)
                               (zerop (mod year n))))
    (and (year-divisible-by 4)
         (or (not (year-divisible-by 100))
             (year-divisible-by 400)))))

(provide 'leap)
;;; leap.el ends here
