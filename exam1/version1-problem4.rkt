#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (id x) x)

(define (last? xs)
  (= 1 (length xs)))

(define (sum ns)
  (apply + ns))

(define (compose f g)
  (lambda (x)
    (f (g x))))

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

(define (consify  n xs)
  (cond
    [(empty? xs) (list)]
    [else (append (list (take n xs)) (consify n (drop n xs)))]))

(define (pair-compose fs)
  (lambda (x)
    (sum (map (lambda (f) (f x))
              (map (lambda (f-pair)
                     (cond
                       [(last? f-pair) (compose (first f-pair) id)]
                       [else (compose (first f-pair) (second f-pair))]))
                   (consify 2 fs))))))

(run-tests
 (test-suite
  "Testing 4th problem with function compositions"
  (let ((g (pair-compose (list add1 add1))))
    (check-equal? (g 1) 3 "Composing add1 . add1 and calling it with 1 should give us 3"))
  
  (let* ((minus1 (lambda (x) (- x 1)))
         (add2 (lambda (x) (+ x 2)))
         (g (pair-compose (list add1 add2 minus1))))
    (check-equal? (g 1) 4 "We are calculating (add1 . add2)(1) + (minus1 . id)(1) = 4 + 0 = 4"))
  
  (let ((g (pair-compose (list add1))))
    (check-equal? (g 1) 2 "We should compose add1 with id and get 2"))
  
  (let* ((square (lambda (x) (* x x)))
         (cube (lambda (x) (* x x x)))
         (negate-sign (lambda (x) (* x -1)))
         (g (pair-compose (list square cube negate-sign square cube negate-sign square cube))))
    (check-equal? (g 2) 116 "(square . cube)(2) + (negate-sign . square)(2) + (cube . negate-sign)(2) + (square . cube)(2) = 64 + (-4) + (-8) + 64 = 116"))
  ))