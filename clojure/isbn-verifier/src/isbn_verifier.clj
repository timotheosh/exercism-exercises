(ns isbn-verifier)

(defn isbn? [isbn]
  (->
   (some->> (clojure.string/replace isbn "-" "")
            (re-matches #"^\d{9}[\dX]$")
            (map (fn [c] (if (= \X c) 10 (Character/digit c 10))))
            (map (fn [n c] (* n c)) (range 10 0 -1))
            (apply +)
            (#(mod % 11))
            zero?)
   ;; No falsey's allowed, must be coerced into boolean.
   boolean))
