#lang racket

(provide nucleotide-counts)

(define (valid-strand? ch)
  (if (or (char=? ch #\A)
          (char=? ch #\C)
          (char=? ch #\G)
          (char=? ch #\T))
      #t
      (error "invalid nucleotide")))

(define (incr-assoc key alist)
  (let ((pos (index-where alist (lambda (x) (char=? (car x) key))))
        (value (cons key (add1 (cdr (assoc key alist))))))
    ;;(displayln (format "pos: ~a val: ~a" pos value))
    (list-set alist pos value)))

(define (nucleotide-counts str)
  (let ((new-list '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))))
    (map (lambda (x) (when (valid-strand? x)
                       (set! new-list (incr-assoc x new-list)))) (string->list str))
    new-list))
