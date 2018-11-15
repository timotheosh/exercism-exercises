#lang racket

(provide response-for)

(define (response-for [phrase ""])
  (let ((s (string-trim phrase)))
    (define (silence?)
      (string=? s ""))
    (define (shouting?)
      (and
       (string=? s (string-upcase s))
       (regexp-match #rx"[a-zA-Z]" s)))
    (define (question?)
      (string-suffix? s "?"))
    (cond [(silence?)  "Fine. Be that way!"]
          [(shouting?) "Whoa, chill out!"]
          [(question?) "Sure."]
          [else        "Whatever."])))
