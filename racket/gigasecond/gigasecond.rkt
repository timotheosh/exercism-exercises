#lang racket

(require racket/date
         threading)

(provide (contract-out
          [add-gigasecond
           (->i ([startdate date?])
                [result date?])]))

(define (add-gigasecond startdate)
  (~> startdate
      date->seconds
      (+ 1e9)
      seconds->date))
