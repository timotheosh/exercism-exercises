(ns armstrong-numbers)

(defn my-expt [x n]
  (reduce * (repeat n x)))

(defn armstrong? [num]
  (->> (str num)
       (map str)
       (map read-string)
       (map #(my-expt % (count (str num))))
       (reduce +)
       (= num)))
