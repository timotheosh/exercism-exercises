(ns phone-number)

(defn- valid-number [num-string]
  (if (= (count num-string) 10)
    num-string
    "0000000000"))

(defn number [num-string]
  (->> num-string
       (filter #(Character/isDigit %))
       (map str)
       (reduce str)
       ((fn [x] (if (= (count x) 11)
                  (clojure.string/replace x #"^1" "")
                  x)))
       (valid-number)))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn pretty-print [num-string]
  (let [num (number num-string)]
    (str "(" (subs num 0 3)  ") " (subs num 3 6) "-" (subs num 6 10))))
