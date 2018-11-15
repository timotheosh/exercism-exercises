(defpackage #:school
  (:use #:common-lisp)
  (:export #:make-school #:add #:grade-roster #:grade #:sorted))

(in-package #:school)

;; Global variable for imperative programming.
(defparameter *school* '())

(defun get-grade (school num)
  "Returns grade num of a given school roster."
  (first
   (remove
    nil
    (mapcar (lambda (x)
              (when (= (getf x :grade) num)
                x))
            school))))

(defun grade (school num)
  (getf (get-grade *school* num) :students))

(defun make-school ()
  "If we were doing pure functions, this would not assign anything,
but just return nil."
  (setf *school* '()))

(defun pure-add (school name grd)
  "This adds a student and grade with a given roster, and is a pure function."
  (let ((sch (mapcar (lambda (x)
                       (if (= (getf x :grade) grd)
                           (list :grade (getf x :grade) :students (cons name (getf x :students)))
                           x))
                     school)))
    (if (equal sch school)
        (cons (list :grade grd :students (list name)) school)
        sch)))

(defun add (school name grd)
  "The necessary imperative function for the unit tests."
  (setf *school* (pure-add *school* name grd)))

(defun pure-sorted (school)
  (let ((sch (sort (copy-list school) #'< :key #'second)))
    (loop
       for x in sch
       collect
         (progn
           (sort (getf x :students) #'string<)
           x))))

(defun sorted (school)
  (pure-sorted *school*))

(defun grade-roster (school)
  *school*)
