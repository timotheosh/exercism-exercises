#lang racket

(provide square total)

(define (square n)
  (expt 2 (sub1 n)))

(define (total)
  (for/sum ([x (in-range 64)])
    (square (add1 x))))
