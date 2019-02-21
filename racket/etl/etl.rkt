#lang racket

(provide
 (contract-out [etl
                (->i ([a (hash/c exact-positive-integer? (listof string?))])
                     [result hash?])]))

(define (etl score)
  (for*/hash ([(k v) score]
              [char v])
    (values (string-downcase char) k)))
