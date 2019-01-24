#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts str)
  (sort (hash->list
         (for/fold ([new-list #hasheq((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))])
                   ([key (in-string str)])
           (hash-update new-list key add1)))
        char<? #:key car))
