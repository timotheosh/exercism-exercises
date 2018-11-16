(ns bob)

(declare has-letters? is-question? is-yelling? silence?)

(defn response-for
  "Returns responses from a lackadaisical teenager."
  [phrase]
  (cond (and (is-question? phrase)
             (is-yelling? phrase)) "Calm down, I know what I'm doing!"
        (is-question? phrase)      "Sure."
        (is-yelling? phrase)       "Whoa, chill out!"
        (silence? phrase)          "Fine. Be that way!"
        :else                      "Whatever."))

(defn- has-letters?
  "Checks if phrase has letters."
  [phrase]
  (> (count
      (filter (fn [x] (Character/isLetter x)) phrase))
     0))

(defn- is-question?
  "Checks if phrase is a question."
  [phrase]
  (clojure.string/ends-with? phrase "?"))

(defn- is-yelling?
  "Checks if phrase is yelling."
  [phrase]
  (and (has-letters? phrase)
       (= phrase (clojure.string/upper-case phrase))))

(defn- silence?
  "Checks for silence."
  [phrase]
  (clojure.string/blank? phrase))
