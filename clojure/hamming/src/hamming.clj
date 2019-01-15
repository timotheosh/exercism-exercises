(ns hamming)

(defn distance [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (get (frequencies (map identical? strand1 strand2)) false 0)))
