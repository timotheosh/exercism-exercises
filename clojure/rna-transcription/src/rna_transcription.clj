(ns rna-transcription)

(def rna-transcription
  {\G \C
   \C \G
   \T \A
   \A \U})

(defn to-rna
  "Given a DNA strand, return its RNA complement (per RNA transcription)."
  [dna]
  {:pre [(every? #{\A \C \G \T} dna)]}
  (->> dna
       (map rna-transcription)
       (apply str)))
