#lang racket

(provide to-roman)

(define (to-roman number)
  (cond [(>= number 1000) (string-append "M" (to-roman (- number 1000)))]
        [(>= number 900) (string-append "CM" (to-roman (- number 900)))]
        [(>= number 500) (string-append "D" (to-roman (- number 500)))]
        [(>= number 400) (string-append "CD" (to-roman (- number 400)))]
        [(>= number 100) (string-append "C" (to-roman (- number 100)))]
        [(>= number 90) (string-append "XC" (to-roman (- number 90)))]
        [(>= number 50) (string-append "L" (to-roman (- number 50)))]
        [(>= number 40) (string-append "XL" (to-roman (- number 40)))]
        [(>= number 10) (string-append "X" (to-roman (- number 10)))]
        [(>= number 9) (string-append "IX" (to-roman (- number 9)))]
        [(>= number 5) (string-append "V" (to-roman (- number 5)))]
        [(>= number 4) (string-append "IV" (to-roman (- number 4)))]
        [(>= number 1) (string-append "I" (to-roman (- number 1)))]
        [else ""]))
