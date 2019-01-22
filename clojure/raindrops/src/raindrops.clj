(ns raindrops)

(defn convert [number]
  (let [sound (str
               (when (zero? (mod number 3)) "Pling")
               (when (zero? (mod number 5)) "Plang")
               (when (zero? (mod number 7)) "Plong"))]
    (if (zero? (count sound))
      (str number)
      sound)))
