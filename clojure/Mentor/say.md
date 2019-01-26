Congratulations on completing the Clojure track!

Just so you know, Clojure has re-implemented Common Lisp's `format`. You can also write the solution as:

``` clojure
(ns say
  (:require [clojure.pprint :refer [cl-format]]))

(defn outside-range? [num]
  (or (< num 0) (> num 999999999999999999999999999999999999999999999999999999999999999999)))

(defn number [num] ;; <- arglist goes here
  (if (outside-range? num)
    (throw (IllegalArgumentException. "number out of range"))
    (cl-format nil "~R" num))
```

Yes, it really does go that high.

If they ever add the roman-numerals exercise to Clojure, you can get them with this:
``` clojure
(cl-format nil "~@R" num)
```
