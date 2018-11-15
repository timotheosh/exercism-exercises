#lang racket/base

(require racket/cmdline
         racket/file)

(provide grep)

(define line-num (make-parameter #f))
(define list-only (make-parameter #f))
(define no-case (make-parameter #f))
(define invert (make-parameter #f))
(define match-line (make-parameter #f))

(define (get-search-string str)
  (if (no-case)
      (format "(?i:~a)" str)
      (format "(?s:~a)" str)))

(define (read-file str a-file)
  (let ([aseq 0]
        [search-string (get-search-string str)])
    (for ([line (file->lines a-file)])
      (if (line-num)
          (set! aseq (add1 aseq))
          (set! aseq ""))
      (if (regexp-match? search-string line)
          (unless (invert)
            (displayln (format "~a ~a" aseq line)))
          (when (invert)
            (displayln (format "~a ~a" aseq line)))))))


(define (grep args)
  (displayln "Hello World!"))

(module+ main
  (define parameters
    (command-line
     #:once-each
     [("-n" "--line-numbers")
      "Print the line numbers of each matching line."
      (line-num #t)]
     [("-l" "--list-files")
      "Print only the names of files that contain at least one matching line."
      (list-only #t)]
     [("-i" "--case-insensitive")
      "Match line using a case insensitive comparison."
      (no-case #t)]
     [("-v" "--invert-matches")
      "Invert matches -- collect all lines that fail to match the pattern."
      (invert #t)]
     [("-x" "--match-line")
      "Only match entire lines, instead of lines that contain a match."
      (match-line #t)]
     #:args files
     files))
  (displayln (format "~A" parameters))
  )
