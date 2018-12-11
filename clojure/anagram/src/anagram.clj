(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for
  "Returns a list of anagrams of word from prospect-list, or empty list if non found. "
  [word prospect-list]
  (filterv (fn [x]
             (if (= (str/lower-case word) (str/lower-case x))
               false
               (= (sort (str/lower-case word))
                  (sort (str/lower-case x))))) prospect-list))
