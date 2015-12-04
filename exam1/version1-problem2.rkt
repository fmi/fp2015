#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (first-or-value xs value)
  (if
   (empty? xs)
   value
   (first xs)))

(define (take n items)
  (cond
    [(empty? items) (list)]
    [(= n 0) (list)]
    [else (cons (first items) (take (- n 1) (rest items)))]))

(define (drop n items)
  (cond
    [(empty? items) (list)]
    [(= n 0) items]
    [else (drop (- n 1) (rest items))]))

(define (sublists-at index items)
  (define (inner items-to-take items)
    (cond
      [(> items-to-take (length items)) (list)]
      [else (cons (take items-to-take items) (inner (add1 items-to-take) items))]))
  (inner 1 (drop index items)))

(define (all-consecutive-subsequences items)
  (apply append
         (map (lambda (index)
                (sublists-at index items))
              (range 0 (length items)))))

(define (is-increasing? ns)
  (cond
    [(empty? ns) #t]
    [(empty? (rest ns)) #t]
    [else (and (< (first ns) (second ns))
               (is-increasing? (rest ns)))]))

(define (max-ordered-sublist ns)
  (first-or-value
   (sort
    (filter is-increasing? (all-consecutive-subsequences ns))
    #:key length >)
   '()))

(run-tests
 (test-suite
  "Testing the problem for max ordered sublist"
  (check-equal? (max-ordered-sublist '(1 5 2 4 6 8 3 4 1)) '(2 4 6 8) "Example from exam")
  (check-equal? (max-ordered-sublist '(1 2 3 4 5 6 7 8)) '(1 2 3 4 5 6 7 8) "When the sequence is increasing, the answer is the entire list")
  (check-equal? (max-ordered-sublist '(7 8 9 1 2 3 4)) '(1 2 3 4) "Check if it finds the longest subsequence")
  (check-equal? (max-ordered-sublist '()) '() "Empty for empty list")
  (check-pred (lambda (x)
                (or
                 (equal? (max-ordered-sublist x) '(1 2 3 4))
                 (equal? (max-ordered-sublist x) '(7 8 9 10))))
              '(7 8 9 10 1 2 3 4)
              "When we have to equal subsequences, both are correct answers")
  
  ))