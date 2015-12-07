#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (sum ns)
  (apply + ns))

(define (divisible? x y)
  (= 0 (remainder x y)))

(define (sum-digits n)
  (sum (map string->number
            (map ~a (string->list (~a n))))))

(define (sum-sum-digit a b k)
  (sum (filter (lambda (x)
                 (divisible? (sum-digits x) k))
               (range a (add1 b)))))


(run-tests
 (test-suite
  "Testing first problem"
  (check-equal? (sum-sum-digit 1 10 1) 55 "When k = 1, we get the sum of all ints between a and b, inclusive")
  (check-equal? (sum-sum-digit 1 10 2) 20 "When k = 2, we get the sum of all even numbers between 1 and 9. 10 is not included, becasue 1 + 0 % 2 != 0")
  (check-equal? (sum-sum-digit 1 10 12) 0 "When k > b, we get 0.")
  (check-equal? (sum-sum-digit 1 100 7) 693 "A larger example")
  ))
