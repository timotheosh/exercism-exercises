(ns say
  (:require [clojure.pprint :refer [cl-format]]))

(defn number [num]
  (if (<= 0 num 999999999999)
    (clojure.string/replace
     (cl-format nil "~R" num)
     "," "")
    (throw (IllegalArgumentException.))))
