#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (sum ns)
  (apply + ns))

(define (product ns)
  (apply * ns))

(define (divisible? x y)
  (= 0 (remainder x y)))

(define (sum-divisors n)
  (define (helper i)
    (if (= i n)
        i
        (+ (if (= 0 (remainder n i)) i 0) (helper (add1 i)))))
  (helper 1))

(define (product-sum-div a b k)
  (product (filter (lambda (x)
                     (divisible? (sum-divisors x) k))
                   (range a (add1 b)))))

(run-tests
 (test-suite
  "Testing first problem"
  (check-equal? (product-sum-div 1 10 1) 3628800)
  (check-equal? (product-sum-div 1 10 2) 6300)
  (check-equal? (product-sum-div 1 10 12) 6)
  (check-equal? (product-sum-div 1 100 7) 268304563877986508606716826418256281600000)
  ))
