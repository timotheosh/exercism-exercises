#lang racket

(provide (contract-out
          [collatz (->* (positive?) (natural-number/c)  natural-number/c)]))

(define (collatz number [step-count 0])
  (cond [(= number 1) step-count]
        [(even? number) (collatz (/ number 2) (add1 step-count))]
        [(odd? number) (collatz (add1 (* number 3)) (add1 step-count))]))
