#lang racket

(define (sum ns)
  (apply + ns))

(define (zip-with f xs ys)
  (map f xs ys))

(define (zip xs ys)
  (zip-with cons xs ys))

(define (enumerate l)
  (zip-with list (range 0 (length l)) l))

(define (row index matrix)
  (list-ref matrix index))

(define (column index matrix)
  (map (lambda (row)
         (list-ref row index))
       matrix))

(define (main-diagonal matrix)
  (map (lambda (enum-row)
         (list-ref (second enum-row) (first enum-row)))
       (enumerate matrix)))

(define (sum-matrix matrix)
  (sum (map sum matrix)))

(define (cartesian-product xs ys)
  (map (lambda (x)
         (map (lambda (y)
                (cons x y))
              ys))
       xs))

(define matrix
  '((1 2 3)
    (4 5 6)
    (7 8 9)))