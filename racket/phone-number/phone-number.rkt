#lang racket

(provide numbers area-code pprint)

(define (numbers number)
  (let* ((n (list->string (filter char-numeric? (string->list number))))
         (num (if (and (= (string-length n) 11)
                       (string=? (substring n 0 1) "1"))
                  (substring n 1)
                  n)))
    (if (= (string-length num) 10)
        num
        "0000000000")))

(define (area-code number)
  (substring (numbers number) 0 3))

(define (pprint number)
  (let ((num (numbers number)))
    (let ((acode (substring num 0 3))
          (pref  (substring num 3 6))
          (suff  (substring num 6)))
      (format "(~a) ~a-~a" acode pref suff))))
