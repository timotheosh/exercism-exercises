(ns series)

(defn slices [string length] ;; <- arglist goes here
  (if (zero? length)
    [""]
    (map #(reduce str %) (partition length 1 string))))
