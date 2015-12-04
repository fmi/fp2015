#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (first-or-value xs value)
  (if
   (empty? xs)
   value
   (first xs)))

(define (take-while p xs)
  (cond
    [(empty? xs) (list)]
    [(p (first xs)) (cons (first xs) (take-while p (rest xs)))]
    [else (list)]))

(define (drop-while p xs)
  (cond
    [(empty? xs) (list)]
    [(not (p (first xs))) xs]
    [else (drop-while p (rest xs))]))

(define (p-equal? x)
  (lambda (y)
    (equal? x y)))

(define (group xs)
  (cond
    [(empty? xs) (list)]
    [else (let ((p (p-equal? (first xs))))
            (cons (take-while p xs) (group (drop-while p xs))))]))

(define (max-eq-subseq xs)
  (first-or-value
   (sort (group xs) #:key length >) '()))

(run-tests
 (test-suite
  "Tests for max-eq-subseq"
  (check-equal? (max-eq-subseq '(1 2 3 3 4 4 4 5 6 6)) '(4 4 4) "Example from exam")
  (check-pred (lambda (x)
                (or
                 (equal? (max-eq-subseq x) '(2 2))
                 (equal? (max-eq-subseq x) '(4 4))
                 (equal? (max-eq-subseq x) '(6 6))))
              '(1 2 2 3 4 4 5 6 6)
              "Example from exam")
  (check-equal? (max-eq-subseq '(1 1 1 1 1)) '(1 1 1 1 1) "Entire list is the result")
  (check-equal? (max-eq-subseq '()) '() "Empty is empty")
  ))
