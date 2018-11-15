#lang racket

(define (hello [name "World"])
  (format "Hello, ~A!" name))

(provide hello)
