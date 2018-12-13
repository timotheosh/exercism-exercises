(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->>
   (partition-by identity plain-text)
   (map #(str (when-not (= 1 (count %)) (count %)) (first %)))
   (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->>
   (re-seq #"\d*\D|\D" cipher-text)
   (map #(re-seq #"\d+|\D" %))
   (map #(if (= (count %) 1) (apply str %) (apply str (repeat (Integer. (first %)) (second %)))))
   (apply str)))
