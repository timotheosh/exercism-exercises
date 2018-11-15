#lang racket

(provide two-fer)

(define (two-fer [name "you"])
  (format "One for ~A, one for me." name))
