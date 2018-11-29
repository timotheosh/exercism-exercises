(ns rna-transcription)

(def rna-transcription
  {\G \C
   \C \G
   \T \A
   \A \U})

(defn to-rna
  "Given a DNA strand, return its RNA complement (per RNA transcription)."
  [dna]
  (assert (re-matches #"[GCTA]+" dna) "DNA can only contain GCTA and must not be empty")
  (apply str (map rna-transcription dna)))
