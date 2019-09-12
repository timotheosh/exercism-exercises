(ns nucleotide-count)

(defn count [nucleotide strand]
  (clojure.core/count (filter #(= nucleotide %) strand)))

(defn nucleotide-counts [strand]
  (let [counts {\A 0 \T 0 \C 0 \G 0}]
    (map #(assoc counts % %) (frequencies strand))))
