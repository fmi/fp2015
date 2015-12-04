(define (series a b n)
  (cond
    [(= n 1) a]
    [(= n 2) b]
    [(zero? n) a]
    [else (series b (+ a b) (- n 1))]))

(define (fibonacci n)
  (series 1 1 n))

(define (lucas n)
  (series 2 1 n))

(define (summed-member n)
  (+ (fibonacci n) (lucas n)))

(define (nth-fibonacci-sum n)
  (define (iter n result)
    (cond
      [(zero? n) result]
      [else (iter (- n 1) (+ result (fibonacci n)))]))
  (iter n 0))

(define (nth-lucas-sum n)
  (define (iter n result)
    (cond
      [(zero? n) result]
      [else (iter (- n 1) (+ result (lucas n)))]))
  (iter n 0))

(define (lucas-fib-diff n)
  (define (iter nth-member current n)
    (cond
      [(= current n) nth-member]
      [else (iter (- (lucas (+ current 1)) (fibonacci (+ current 1))) (+ current 1) n)]))
  (iter 1 1 n))
