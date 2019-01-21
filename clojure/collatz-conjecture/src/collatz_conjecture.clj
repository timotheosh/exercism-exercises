(ns collatz-conjecture)

(defn collatz
  ([number] (collatz number 0))
  ([number steps]
   (cond (= number 1) steps
         (even? number) (collatz (/ number 2) (inc steps))
         (odd? number)  (collatz (inc (* number 3)) (inc steps)))))
