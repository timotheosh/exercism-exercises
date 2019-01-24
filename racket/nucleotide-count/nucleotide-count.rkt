#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts dna)
  (for/fold
      ([acc '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))])
      ([n dna])
    (dict-update acc n add1)))
