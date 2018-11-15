(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (num)
  "Returns the verse for the given number num."
  (let ((verse-n
         (vector
          (format nil "No more bottles of beer on the wall, no more bottles of beer.~%Go to the store and buy some more, 99 bottles of beer on the wall.~%")
          (format nil "1 bottle of beer on the wall, 1 bottle of beer.~%Take it down and pass it around, no more bottles of beer on the wall.~%")
          (format nil "2 bottles of beer on the wall, 2 bottles of beer.~%Take one down and pass it around, 1 bottle of beer on the wall.~%")
          (format nil "~d bottles of beer on the wall, ~d bottles of beer.~%Take one down and pass it around, ~d bottles of beer on the wall.~%" num num (- num 1)))))
    (if (< num 3)
        (elt verse-n num)
        (elt verse-n 3))))

(defun sing (&optional (start 99) (end 0))
  (if (or (< end 0)
          (> start 99)
          (> end start))
      (error "That's not how the song goes... try just running (sing).")
      (format nil "~{~A~%~}"(loop for num from start downto end collect (verse num)))))
