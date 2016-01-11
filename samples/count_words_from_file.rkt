#lang racket

(require "file-utils.rkt")

(define (word-count words)
  (define (word-count-loop words table)
    (cond
      [(empty? words) table]
      [else
        (hash-set! table (first words) (+ (hash-ref table (first words) 0) 1)) (word-count-loop (rest words) table)]))
  (let
    ([h (make-hash)])
    (word-count-loop words h)))

(define (main)
  (let* ([content-lines (lines (read-file "words"))]
         [data (apply append (map words content-lines))]
         [count (word-count data)])
    (hash-for-each count (lambda (key value)
                           (displayln (string-append key " : " (~a value)))))))
(main)
