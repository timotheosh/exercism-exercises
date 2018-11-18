#lang racket/base

(provide sum-of-squares square-of-sum difference)

;; The function sqr is unavailable in racket/base, so we'll use our own.
(define (square n)
  (* n n))

(define (square-of-sum num)
  (square (for/sum ([i (in-range (add1 num))]) i)))

(define (sum-of-squares num)
  (for/sum ([i (in-range (add1 num))])
    (square i)))

(define (difference num)
  (- (square-of-sum num) (sum-of-squares num)))
