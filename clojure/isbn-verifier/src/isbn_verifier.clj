(ns isbn-verifier)

(defn- hygenize-isbn
  "Returns the match if an ISBN number contains all valid numbers and a valid check character."
  [isbn]
  (when (re-matches #"\d-?\d\d\d-?\d\d\d\d\d-?[\d|X]" isbn)
    (clojure.string/replace isbn #"-" "")))

(defn- isbn->vec
  "Converts an isbn string into a list of numbers for our calculation."
  [isbn]
  (let [lst (mapv read-string (clojure.string/split isbn #""))]
    (if (= 'X (last lst))
      (assoc lst (dec (count lst)) 10)
      lst)))

(defn isbn?
  "Checks if given string isbn is a valid ISBN-10 number."
  [isbn]
  (let [h-isbn (hygenize-isbn isbn)]
    (if (and h-isbn
             (zero? (mod (reduce + (map (fn [x y] (* x y))
                                        (isbn->vec h-isbn)
                                        (range 10 0 -1)))
                         11)))
      true
      false)))
