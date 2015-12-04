(define (string-repeat str n)
  (define (iter str n result)
    (cond
      [(zero? n) result]
      [else (iter str (- n 1) (string-append result str))]))
  (iter str n ""))

(define (dash-count n)
  (round (+ 1 (log n))))

(define (fence-dash n)
  (string-repeat "-" (dash-count n)))

(define (fence n)
  (string-append "{" (fence-dash n) ">" (~a n) "<" (fence-dash n) "}"))
