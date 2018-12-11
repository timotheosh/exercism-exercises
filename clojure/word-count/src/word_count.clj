(ns word-count)

(defn word-count [string]
  (frequencies
   (re-seq #"\w+"
           (clojure.string/lower-case string))))
