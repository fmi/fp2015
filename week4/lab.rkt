#lang racket

(provide
  call-n-times
  compose
  calculate
  twice
  twice2
  get-operation
  negate)

(define (calculate operation a b)
  (operation a b))

(define (twice f x)
  (f (f x)))

(define (get-operation oper)
  (cond
    [(equal? oper "+") +]
    [(equal? oper "-") -]
    [(equal? oper "*") *]
    [(equal? oper "/") /]
    [else +]))

(define (negate p)
  (lambda (x) (not (p x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (twice2 f x)
  ((compose f f) x))

(define (accumulate
