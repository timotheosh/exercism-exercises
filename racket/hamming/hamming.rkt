#lang racket

(provide hamming-distance)

(define (hamming-distance strand1 strand2)
  (if (= (string-length strand1) (string-length strand2))
      (count (negate char=?)
             (string->list strand1)  (string->list strand2))
      (error "String lengths do not match!")))
