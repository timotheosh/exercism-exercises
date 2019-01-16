(ns roman-numerals
  (:require [clojure.pprint :refer [cl-format]]))

;; The easy way
(defn numeral-easy [number]
  (cl-format nil "~@R" number))


;; The lil' more challengin way.
(defn numeral-hard [number]
  (cond (>= number 1000) (str "M" (numeral-hard (- number 1000)))
        (>= number 900) (str "CM" (numeral-hard (- number 900)))
        (>= number 500) (str "D" (numeral-hard (- number 500)))
        (>= number 400) (str "CD" (numeral-hard (- number 400)))
        (>= number 100) (str "C" (numeral-hard (- number 100)))
        (>= number 90) (str "XC" (numeral-hard (- number 90)))
        (>= number 50) (str "L" (numeral-hard (- number 50)))
        (>= number 40) (str "XL" (numeral-hard (- number 40)))
        (>= number 10) (str "X" (numeral-hard (- number 10)))
        (>= number 9) (str "IX" (numeral-hard (- number 9)))
        (>= number 5) (str "V" (numeral-hard (- number 5)))
        (>= number 4) (str "IV" (numeral-hard (- number 4)))
        (>= number 1) (str "I" (numeral-hard (- number 1)))
        :else ""))

(defn numerals [number]
  (numeral-hard number))
