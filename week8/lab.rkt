#lang racket

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (id x) x)

(define (compose-list fs)
   (cond
     [(empty? fs) id]
     [else (compose (first fs) (compose-list (rest fs)))]))

(define (take n items)
  (cond
    [(empty? items) (list)]
    [(= n 0) (list)]
    [else (cons (first items) (take (- n 1) (rest items)))]))

(define (drop n items)
  (cond
    [(empty? items) (list)]
    [(= n 0) items]
    [else (drop (- n 1) (rest items))]))

(define (sublists-at index items)
  (define (inner items-to-take items)
    (cond
      [(> items-to-take (length items)) (list)]
      [else (cons (take items-to-take items) (inner (add1 items-to-take) items))]))
  (inner 1 (drop index items)))

; This is called remove-duplicates in Racket
(define (dedup xs)
  (define (iter xs rs)
    (cond
      [(empty? xs) rs]
      [(member (first xs) rs) (iter (rest xs) rs)]
      [else (iter (rest xs) (append rs (list (first xs))))]))
  (iter xs '()))