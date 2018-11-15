#lang racket

(require racket/date)

(define (add-gigasecond startdate)
  (seconds->date
   (+ (date->seconds startdate) 1e9)))

(provide add-gigasecond)
