#lang racket

(provide leap-year?)

(define/contract (leap-year? year)
  (-> positive? boolean?)
  "Takes a positive integer, representative of a given year in the
gregorian calendar and will return true is it is a leap year, and
false if it is not."
  (let ((divide-by (lambda (x)
                     (zero? (modulo year x)))))
    (or
     (divide-by 400)
     (and
      (not (divide-by 100))
      (divide-by 4)))))
