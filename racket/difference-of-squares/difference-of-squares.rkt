#lang racket

(provide sum-of-squares square-of-sum difference)

(define (square-of-sum num)
  (sqr (for/sum ([i (in-range (add1 num))]) i)))

(define (sum-of-squares num)
  (for/sum ([i (in-range (add1 num))])
    (sqr i)))

(define (difference num)
  (- (square-of-sum num) (sum-of-squares num)))
