(ns reverse-string)

(defn reverse-string [s]
  (reduce str (reverse s)))
