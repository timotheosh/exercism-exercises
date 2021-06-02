;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-roman (number)
  (cond ((>= number 1000) (concat "M" (to-roman (- number 1000))))
        ((>= number 900) (concat "CM" (to-roman (- number 900))))
        ((>= number 500) (concat "D" (to-roman (- number 500))))
        ((>= number 400) (concat "CD" (to-roman (- number 400))))
        ((>= number 100) (concat "C" (to-roman (- number 100))))
        ((>= number 90) (concat "XC" (to-roman (- number 90))))
        ((>= number 50) (concat "L" (to-roman (- number 50))))
        ((>= number 40) (concat "XL" (to-roman (- number 40))))
        ((>= number 10) (concat "X" (to-roman (- number 10))))
        ((>= number 9) (concat "IX" (to-roman (- number 9))))
        ((>= number 5) (concat "V" (to-roman (- number 5))))
        ((>= number 4) (concat "IV" (to-roman (- number 4))))
        ((>= number 1) (concat "I" (to-roman (- number 1))))
        (t "")))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
