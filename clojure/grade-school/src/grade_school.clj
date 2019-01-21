(ns grade-school)

(defn grade [school the-grade]
  (get school the-grade []))

(defn add [school name the-grade]
  (assoc school the-grade (conj (grade school the-grade) name)))

(defn sorted [school]
  (into {} (sort (for [[the-grade names] school] [the-grade (sort names)]))))
