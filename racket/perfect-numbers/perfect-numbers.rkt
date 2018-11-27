#lang racket

(provide classify)


(define (classify n)
  (define sum
    (for/sum ([x (in-range 1 (add1 (quotient n 2)))]
              #:when (zero? (modulo n x)))
      x))
  (cond ((= n sum) 'perfect)
        ((> n sum) 'deficient)
        (else      'abundant)))
