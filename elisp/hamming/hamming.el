;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun hamming-distance (strand1 strand2)
  "Number of positional differences in two equal length dna strands."
  (if (= (length strand1) (length strand2))
      (cl-loop for x across strand1
               for y across strand2
               count (not (= x y)))
    (error "strands are not the same length!")))

(provide 'hamming)
;;; hamming.el ends here
