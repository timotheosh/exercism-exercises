(ns armstrong-numbers)

(defn my-expt [x n]
  (reduce * (repeat n x)))

(defn armstrong? [num]
  (->> (str num)
       (map js/parseInt)
       ((fn [x]
          (map #(my-expt % (count x)) x)))
       (reduce +)
       (= num)))
