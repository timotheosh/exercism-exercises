;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:
(require 'cl)

(defun hamming-distance (strand1 strand2)
  "Number of positional differences in two equal length dna strands."
  (if (= (length strand1) (length strand2))
      (count t
             (map 'list (lambda(a b) (not (char-equal a b))) strand1 strand2))
    (error "strands are not the same length!")))

(provide 'hamming)
;;; hamming.el ends here
