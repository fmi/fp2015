#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (sum ns)
  (apply + ns))

(define (product ns)
  (apply * ns))

(define (divisible? x y)
  (= 0 (remainder x y)))

(define (sum-digits n)
  (sum (map string->number
            (map ~a (string->list (~a n))))))

(define (product-sum-div a b k)
  (product (filter (lambda (x)
                     (divisible? (sum-digits x) k))
                   (range a (add1 b)))))

(run-tests
 (test-suite
  "Testing first problem"
  (check-equal? (product-sum-div 1 10 1) 3628800 "When k = 1, we get the product of all ints between a and b, inclusive")
  (check-equal? (product-sum-div 1 10 2) 384 "When k = 2, we get the product of all even numbers between 1 and 9. 10 is not included, becasue 1 + 0 % 2 != 0")
  (check-equal? (product-sum-div 1 10 12) 1 "When k > b, we get 1.")
  (check-equal? (product-sum-div 1 100 7) 2294089349563531520000 "A larger example")
  ))
