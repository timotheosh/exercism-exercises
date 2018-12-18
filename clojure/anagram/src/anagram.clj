(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for
  "Returns a list of anagrams of word from prospect-list, or empty list if non found. "
  [word prospect-list]
  (filter (fn [x]
            (and (not= (str/lower-case word) (str/lower-case x))
                 (= (frequencies (str/lower-case word))
                    (frequencies (str/lower-case x)))))
          prospect-list))
