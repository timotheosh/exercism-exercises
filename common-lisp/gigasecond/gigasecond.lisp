(in-package #:cl-user)
(defpackage #:gigasecond
  (:use #:cl)
  (:export #:from))
(in-package #:gigasecond)

(defun from (year month day hour minute second)
  (multiple-value-bind
        (nsecond nminute nhour nday nmonth nyear dof dst-p tz)
      (decode-universal-time
       (+ 1000000000 (encode-universal-time second minute hour day month year 0)) 0)
    (list nyear nmonth nday nhour nminute nsecond)))
