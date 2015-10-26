#lang racket

(provide
  call-n-times
  compose
  calculate
  twice
  twice2
  add2
  add3
  get-operation
  negate)

(define (calculate operation a b)
  (operation a b))

(define (twice f x)
  (f (f x)))

; Викаме n поредни пъти функцията f с първи аргумент x
(define (call-n-times n f x)
  (cond
    [(zero? n) x]
    [else (call-n-times (- n 1) f (f x))]))

; Функции, които връщат функции
(define (get-operation oper)
  (cond
    [(equal? oper "+") +]
    [(equal? oper "-") -]
    [(equal? oper "*") *]
    [(equal? oper "/") /]
    [else +]))

(define (add2 x)
  (lambda (y)
    (+ x y)))

(define (add3 x)
  (lambda (y)
    (lambda (z)
      (+ x y z))))

(define (negate p)
  (lambda (x) (not (p x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (twice2 f x)
  ((compose f f) x))

