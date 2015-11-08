#lang racket

(define (filter2 p xs)
  (cond
    [(empty? xs) (list)]
    [(p (first xs)) (cons (first xs) (filter2 p (rest xs)))]
    [else (filter2 p (rest xs))]))

; Reduce using standard recursion
; Also known as foldr
(define (reduce-r op z xs)
  (cond
    [(empty? xs) z]
    [else (reduce op (op z (first xs)) (rest xs))]))

; Reduce using tail-call recursion
; Also known as foldl
(define (reduce op z xs)
  (cond
    [(empty? xs) z]
    [else (reduce op (op z (first xs)) (rest xs))]))

(define (sum ns)
  (reduce + 0 ns))

(define (concat words)
  (reduce string-append "" words))

(define (join glue xs)
  (reduce (lambda (acc x)
            (string-append acc glue x))
          (first xs)
          (rest xs)))

(define (negate p)
  (lambda (x)
    (not (p x))))

(define (reject p xs)
  (filter (negate p) xs))

(define (all? p xs)
  (= (length xs)
     (length (filter p xs))))

(define (any? p xs)
  (>= 1
      (length (filter p xs))))

(define (count y xs)
  (length
   (filter (lambda (x) (equal? x y)) xs)))

(define (count2 y xs)
  (sum (map (lambda (x)
              (if (equal? x y)
                  1
                  0))
            xs)))

(define (zip xs ys)
  (cond
    [(empty? xs) (list)]
    [(empty? ys) (list)]
    [else (cons (cons (first xs) (first ys))
                (zip (rest xs) (rest ys)))]))

; Използвайки знанието за това как работи map в Racket
(define (zip2 xs ys)
  (map cons xs ys))

