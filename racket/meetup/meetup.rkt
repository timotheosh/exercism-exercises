#lang racket
(require racket/date)
(require gregor)
(provide meetup-day)

(define day-of-week '("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))

(define days-per-month '(31 28 31 30 31 30 31 31 30 31 30 31))

(define (first-day-of-week year month)
  "Returns the day of the week the 1st of the given month/year (0-6)."
  (date-week-day (seconds->date (find-seconds 0 0 0 1 month year))))

(define (first-occurance-weekday year month weekday)
  (let ((first-day (first-day-of-week year month))
        (dow (index-of day-of-week (symbol->string weekday))))
    (cond [(> dow first-day) (add1 (- dow first-day))]
          [(< dow first-day) (+ (- 6 first-day) dow 2)]
          [(= dow first-day) 1]
          [else #f])))

(define (all-dow-month year month weekday)
  (let ((max (if (and (= month 2)
                      (leap-year? year))
                 29
                 (list-ref days-per-month (sub1 month)))))
    (let loop ((dom (list (first-occurance-weekday year month weekday))))
      (let ((next-day (+ (last dom) 7)))
        (if (> next-day max)
            dom
            (loop (sort (cons (+ (last dom) 7) dom) <)))))))

(define (teenth days)
  (first (filter (lambda (x) (and (> x 12) (< x 20))) days)))

(define (meetup-day year month weekday occur)
  (let ((days (all-dow-month year month weekday)))
    (let ((day ((eval occur) days)))
      (seconds->date (find-seconds 0 0 0 day month year #f) #f))))
