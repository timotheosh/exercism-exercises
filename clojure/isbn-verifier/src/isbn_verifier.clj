(ns isbn-verifier)

(defn dash?
  "Predicate function that returns true if string is a dash."
  [string]
  (= string "-"))

(defn valid-number?
  "Returns true if an ISBN number contains all valid numbers and a valid check character."
  [isbn]
  (let [seq (reverse
             (map read-string
                  (remove isbn-verifier/dash?
                          (clojure.string/split isbn #""))))]
    (and (= (count seq) 10)
         (empty? (remove number? (rest seq)))
         (or (number? (first seq))
             (= (first seq) 'X)))))

(defn isbn?
  "Checks if given string isbn is a valid ISBN-10 number."
  [isbn]
  (if (and (valid-number? isbn)
           (let [seq (map (fn [x] (if (= x 'X) 10 x))
                          (map read-string
                               (remove isbn-verifier/dash?
                                       (clojure.string/split isbn #""))))]
             (zero? (mod (apply +
                                (map (fn [x y] (* x y)) seq (range 10 0 -1)))
                         11))))
    true
    false))
