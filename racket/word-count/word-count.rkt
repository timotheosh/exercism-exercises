#lang racket

(provide word-count)

(define (word-count word-list)
  (let ((words  (make-hash))
        (wlist (string-split word-list)))
    (for/list ([x wlist])
      (unless (hash-has-key? words x)
        (hash-set! words x (count (lambda (y) (string=? x y)) wlist))))
    words))
