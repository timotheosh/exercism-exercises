#lang racket
(provide my-reverse)

(define (my-reverse str)
  (list->string (reverse (string->list str))))
