#lang racket

(define (atom? x)
  (not (or
        (pair? x)
        (null? x)
        (vector? x))))

; Тук обхождаме дълбок списък с идея за странични ефекти
; Не е задължително да гледате функцията, просто е хубав пример при нужда
(define (walk-deep-list f l)
  (cond
    [(null? l) (void)]
    [(atom? (first l)) (begin
                       (f (first l))
                       (walk-deep-list f (rest l)))]
    [else (begin
            (walk-deep-list f (first l))
            (walk-deep-list f (rest l)))]))

(define (count-atoms l)
  (cond
    [(null? l) 0]
    [(atom? (first l)) (+ 1 (count-atoms (rest l)))]
    [else (+ (count-atoms (first l)) (count-atoms (rest l)))]))

(define (deep-map f l)
  (cond
    [(null? l) (list)]
    [(atom? (first l)) (cons (f (first l)) (deep-map f (rest l)))]
    [else (cons (deep-map f (first l)) (deep-map f (rest l)))]))

(define (flatten l)
  (cond
    [(null? l) (list)]
    [(atom? (first l)) (cons (first l) (flatten (rest l)))]
    [else (append (flatten (first l)) (flatten (rest l)))]))

(define (sum-atoms l)
  (apply + (flatten l)))

(define (sum-atoms2 l)
  (cond
    [(null? l) 0]
    [(atom? (first l)) (+ (first l) (sum-atoms2 (rest l)))]
    [else (+ (sum-atoms2 (first l)) (sum-atoms2 (rest l)))]))

(define (make-tree node left right)
  (list node left right))

(define (make-leaf node)
  (make-tree node '() '()))

(define (empty-tree? tree)
  (null? tree))

(define (root tree)
  (first tree))

(define (left tree)
  (first (rest tree)))

(define (right tree)
  (first (rest (rest tree))))

(define (count-nodes tree)
  (cond
    [(empty? tree) 0]
    [else (+ 1 (count-nodes (left tree)) (count-nodes (right tree)))]))

(define (height tree)
  (cond
    [(empty? tree) 0]
    [else (+1 (max (height (left tree)) (height (right tree))))]))

;    1
;   / \
;  2   3
; / \
;5   6
(define t
  (make-tree 1
    (make-tree 2
      (make-leaf 5)
      (make-leaf 6))
    (make-leaf 3)))
