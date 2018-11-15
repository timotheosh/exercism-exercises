(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun primes-to (limit)
  (loop for x from 2 to limit
       #:when (or (= x 2) (oddp x))
     collect x))
