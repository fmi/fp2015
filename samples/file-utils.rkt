#lang racket

(provide
  lines
  unlines
  words
  unwords
  read-file)

; Splits str in list of new lines
(define (lines str)
  (string-split str "\n" #:trim? #t))

; Joins the list into one str
(define (unlines strs)
  (string-join strs "\n"))

(define (words str)
  (string-split str " " #:trim? #t))

(define (unwords strs)
  (string-join strs " "))

; You can also use (file->string path) function
(define (read-file path)
  (call-with-input-file path
                        (lambda (in)
                          (port->string in))))
