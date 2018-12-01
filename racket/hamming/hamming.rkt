#lang racket

(provide (contract-out
          [hamming-distance
          (->i ([a string?] [b string?])
               #:pre (a b) ((string-length a) . = . (string-length b))
               [result exact-nonnegative-integer?])]))

(define (hamming-distance strand1 strand2)
  (for/sum [[char1 strand1]
            [char2 strand2]
            #:unless (char=? char1 char2)]
    1))
