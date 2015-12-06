#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (sum ns)
  (apply + ns))

(define (divisible? x y)
  (= 0 (remainder x y)))

(define (sum-divisors n)
  (define (helper i)
    (if (= i n)
        i
        (+ (if (= 0 (remainder n i)) i 0) (helper (add1 i)))))
  (helper 1))

(define (sum-sum-digit a b k)
  (sum (filter (lambda (x)
                 (divisible? (sum-divisors x) k))
               (range a (add1 b)))))


(run-tests
 (test-suite
  "Testing first problem"
  (check-equal? (sum-sum-digit 1 10 1) 55)
  (check-equal? (sum-sum-digit 1 10 2) 31)
  (check-equal? (sum-sum-digit 1 10 12) 6)
  (check-equal? (sum-sum-digit 1 100 7) 1419)
  ))
