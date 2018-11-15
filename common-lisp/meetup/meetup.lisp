(in-package #:cl-user)
(defpackage #:meetup
  (:use #:common-lisp)
  (:export #:meetup))

(in-package #:meetup)

(defconstant +day-of-week+
  '(:monday :tuesday :wednesday :thursday :friday :saturday :sunday))

(defconstant +days-per-month+ '(31 28 31 30 31 30 31 31 30 31 30 31))

(defun leap-year-p (year)
  (flet ((evenly-divisible (x y) (zerop (mod x y))))
    (flet ((year-divisible-by (n) (evenly-divisible year n)))
      (and (year-divisible-by 4)
           (or (not (year-divisible-by 100))
               (year-divisible-by 400))))))

(defun first-day-of-week (year month)
  "Returns the day of the week the 1st of the given month/year (0-6)."
  (nth-value
   6
   (decode-universal-time
    (encode-universal-time 0 0 0 1 month year 0)
    0)))

(defun first-occurance-weekday (year month weekday)
  "Returns the first day of the month for the given weekday (0-6)."
  (let ((first-day (first-day-of-week year month))
        (dow (position weekday +day-of-week+)))
    (cond ((> dow first-day) (1+ (- dow first-day)))
          ((< dow first-day) (+ (- 6 first-day) dow 2))
          ((= dow first-day) 1))))

(defun all-dow-month (year month weekday)
  "Returns the days of month that fall on the given weekday."
  (labels ((days-of-month (dom)
             (let ((max (if (and (= month 2)
                                 (leap-year-p year))
                            29
                            (nth (1- month) +days-per-month+))))
               (let ((next-day (+ (car (last dom)) 7)))
                 (if (> next-day max)
                     dom
                     (days-of-month (sort (cons next-day dom) #'<)))))))
    (days-of-month (list
                    (first-occurance-weekday year month weekday)))))

(defun teenth (days)
  "Returns the 'teenth' day given a list of days."
  (first (remove-if-not (lambda (x) (and (> x 12) (< x 20))) days)))

(defun meetup (month year weekday occur)
  (let  ((days (all-dow-month year month weekday)))
    (let ((day (eval (list (find-symbol (symbol-name occur)) `(quote ,days)))))
      `(quote (,year ,month ,day)))))
