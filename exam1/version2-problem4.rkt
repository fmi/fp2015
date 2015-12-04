#lang racket

(require rackunit)
(require rackunit/text-ui)

(define (sum ns)
  (apply + ns))

(define (zip-with f xs ys)
  (map f xs ys))

(define (zip xs ys)
  (zip-with cons xs ys))

(define (fst pair)
  (car pair))

(define (snd pair)
  (cdr pair))

(define (id x) x)

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (pad-last-with to-pad times xs)
  (append xs
          (map (lambda (_) to-pad)
               (range 0 times))))

(define (list-compose fs1 fs2)
  (let*
      ((n (length fs1))
       (m (length fs2))
       (fs (pad-last-with id (abs (min 0 (- n m))) fs1))
       (gs (pad-last-with id (abs (min 0 (- m n))) fs2))
       (zipped (zip fs gs)))
    (lambda (x)
      (sum
       (map (lambda (f-pair)
              ((compose (fst f-pair) (snd f-pair)) x))
            zipped)))))

(run-tests
 (test-suite
  "Testing 4th problem with function compositions"
  (let ((g (list-compose (list add1 add1) (list add1 add1))))
    (check-equal? (g 1) 6 "(add1 . add1)(1) + (add1 . add1)(1) = 3 + 3 = 6"))
  
  (let* ([minus1 (lambda (x) (- x 1))]
         [add2 (lambda (x) (+ x 2))]
         [g (list-compose (list add1 add2) (list minus1 minus1))])
    (check-equal? (g 1) 3 "(add1 . minus1)(1) + (add2 . minus1(1) = 1 + 2 = 3"))
  
  (let ((g (list-compose (list add1) (list))))
    (check-equal? (g 1) 2 "We should compose add1 with id and get 2"))
  
  (let* ((square (lambda (x) (* x x)))
         (cube (lambda (x) (* x x x)))
         (negate-sign (lambda (x) (* x -1)))
         [g (list-compose (list square negate-sign cube square)
                          (list square cube negate-sign cube))])
    (check-equal? (g 2) 64 "(square . square)(2) + (negate-sign . cube)(2) + (cube . negate-sign)(2) + (squre . cube)(2) = 16 + -8 + -8 + 64 = 64"))
  ))
