#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (zip-with f xs ys)
  (map f xs ys))

(define (zip xs ys)
  (zip-with cons xs ys))

(define (enumerate l)
  (zip-with list (range 0 (length l)) l))

(define (drop n items)
  (cond
    [(empty? items) (list)]
    [(= n 0) items]
    [else (drop (- n 1) (rest items))]))

; all? returns #f for empty lists
(define (all? p xs)
  (let ((n (length xs))
        (m (length (filter p xs))))
    (and
     (not (zero? n))
     (= n m))))

; (1 0 0)
; (4 5 0)
; (7 8 9)
(define (triangular? m)
  (all? zero?
        (apply append
               (map (lambda (enum-row)
                      (drop (add1 (first enum-row)) (second enum-row)))
                    (enumerate m)))))

(run-tests
 (test-suite
  "Tests for 3rd problem"
  (check-false (triangular? '((1 2 3)
                              (0 5 6)
                              (0 0 9))) "Example from exam")
  (check-false (triangular? '((0 2 3)
                              (0 0 6)
                              (1 0 0))) "Example from exam")
  (check-true (triangular? '((1 0 0)
                             (4 5 0)
                             (7 8 9))) "Example from exam")
  (check-false (triangular? '((0 0 1)
                              (4 0 0)
                              (7 0 0))) "Example from exam")
  (check-false (triangular? '((1))) "1x1 matrix cannot be triangular")
  (check-true (triangular? '((1 0)
                             (1 3))) "2x2 matrix can be triangular if there is one 0 in the top corner")
  (check-false (triangular? '((1 2 3 4)
                              (0 1 5 6)
                              (0 0 1 7)
                              (0 0 0 8))) "A 4x4 non-triangular matrix")
  (check-true (triangular? '((1 0 0 0)
                             (0 1 0 0)
                             (0 0 1 0)
                             (0 1 0 8))) "A 4x4 triangular matrix")
  ))
