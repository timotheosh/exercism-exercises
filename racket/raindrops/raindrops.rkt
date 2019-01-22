#lang racket

(provide convert)

(define (convert number)
  (let ([sound (string-append
                (if (zero? (modulo number 3)) "Pling" "")
                (if (zero? (modulo number 5)) "Plang" "")
                (if (zero? (modulo number 7)) "Plong" ""))])
    (if (zero? (string-length sound))
        (number->string number)
        sound)))
