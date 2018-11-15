#lang racket

(provide to-rna)

(define (to-rna str)
  (let ((strand (string->list (string-upcase str))))
    (apply string
           (map (lambda (x)
                  (case x
                    [(char=? #\G) #\C]
                    [(char=? #\C) #\G]
                    [(char=? #\T) #\A]
                    [(char=? #\A) #\U]
                    [else exn:fail])) strand))))
