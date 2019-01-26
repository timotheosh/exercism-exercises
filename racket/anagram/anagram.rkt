#lang racket

(provide anagrams-for)

(define (anagrams-for str lst)
  "Returns the anagram of str from lst, or empty list if non found."
  (filter (lambda (x)
            (and (not (string=? str x))
                 (equal? (sort (string->list (string-downcase str)) char<?)
                        (sort (string->list (string-downcase x)) char<?)))) lst))
