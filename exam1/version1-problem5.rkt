#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (all-sums ns)
  (define (helper ns index sum)
    (cond
      [(= index (length ns))
       (list sum)]
      [else (append (helper ns (add1 index) (+ sum (list-ref ns index)))
                    (helper ns (add1 index) sum))]))
  (remove-duplicates (rest (sort (helper ns 0 0) <))))


(define (sort-and-dedup answer)
  (sort (remove-duplicates answer) <))

(run-tests
 (test-suite
  "Running tests for 5th problem - all sums"
  (check-equal? (sort-and-dedup (all-sums '(1 2 3))) '(1 2 3 4 5 6) "Example from exam")
  (check-equal? (sort-and-dedup (all-sums '(0 1 2))) '(0 1 2 3) "Example from exam")
  (check-equal? (sort-and-dedup (all-sums '(3 7 9))) '(3 7 9 10 12 16 19))
  (check-equal? (sort-and-dedup (all-sums '(0))) '(0) "All sums from 0 are 0")
  (check-equal? (sort-and-dedup (all-sums '(1 2 3 4 5 6 7 8 9 10)))
                '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55)
                "All possible sums between numbers 1 to 10")
  ))