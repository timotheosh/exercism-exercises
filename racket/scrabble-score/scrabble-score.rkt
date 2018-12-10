#lang racket

(provide
 (contract-out
  [score (string? . -> . exact-nonnegative-integer?)]))


(define (letter-score letter)
  (or (for/first
          ([characters '(("AEIOULNRST" . 1)
                         ("DG"         . 2)
                         ("BCMP"       . 3)
                         ("FHVWY"      . 4)
                         ("K"          . 5)
                         ("JX"         . 8)
                         ("QZ"         . 10))]
           #:when (string-contains? (car characters) letter))
        (cdr characters))
      0))

(define (score word)
  (for/sum ([letter (string-upcase word)])
    (letter-score (string letter))))
