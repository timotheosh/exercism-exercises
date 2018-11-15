#lang racket

(provide perfect-numbers)


(define (perfect? n)
  (= n
     (let ([half (add1 (quotient n 2))])
       (for/sum ([x (in-range 1 half)])
         (if (zero? (modulo n x))
             x
             0)))))


(define (perfect-numbers n)
  (for/list ([i (in-range 1 (add1 n))]
             #:when (perfect? i))
    i))
