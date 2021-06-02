;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(defun square-of-sum (num)
  (expt (apply '+ (number-sequence 0 num)) 2))

(defun sum-of-squares (num)
  (apply '+
         (mapcar (lambda (x) (expt x 2))
                 (number-sequence 0 num))))

(defun difference (num)
  (- (square-of-sum num) (sum-of-squares num)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
