(ns word-count)

(defn word-count [string]
  (frequencies
   (re-seq #"\w+"
           (clojure.string/lower-case string))))

(defn word-count-2
  [input]
  (->> input
       clojure.string/lower-case
       (#(re-seq #"\w+" %))
       frequencies))
