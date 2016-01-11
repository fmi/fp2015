#lang racket

(require "file-utils.rkt")

(define (main)
  (let* ([contents (read-file "README.md")])
    (displayln contents)
    (displayln (length (lines contents)))))

(main)
