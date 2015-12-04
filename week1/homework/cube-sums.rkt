(define (cube-sum a b)
  (+ (* a a a) (* b b b)))

(define (cube-sum-equal? n a b)
  (= n (cube-sum a b)))

(define (search-cube-sums-a target a b)
  (cond
    [(> (cube-sum a b) target) (list)]
    [(cube-sum-equal? target a b) (append (list target a b) (search-cube-sums-a target (+ a 1) b))]
    [else (append (list) (search-cube-sums-a target (+ a 1) b))]))

(define (search-cube-sums target a b)
 (cond
   [(> (cube-sum a b) target) (list)]
   [else (append (search-cube-sums-a target a b) (search-cube-sums target a (+ b 1)))]))

(define (list-cube-sums to)
  (cond
    [(zero? to) (list)]
    [else (append (list (search-cube-sums to 1 1)) (list-cube-sums (- to 1)))]))
    
