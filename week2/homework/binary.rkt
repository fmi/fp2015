(define (string-reverse str)
  (define (iter n str result)
    (cond
      [(zero? n) result]
      [else (iter (- n 1) str (string-append result (~a (string-ref str (- n 1)))))]))
  (iter (string-length str) str ""))

(define (to-binary-string n)
  (define (iter n result)
    (cond
      [(zero? n) (string-reverse result)]
      [else (iter (quotient n 2) (string-append result (~a (remainder n 2))))]))
  (iter n ""))

(define (from-binary-string binary-str)
  (define (iter n index result)
    (cond
      [(zero? n) result]
      [else (iter (quotient n 10) (+ index 1 ) (+ result (* (remainder n 10) (expt 2 index))))]))
  (iter (string->number binary-str) 0 0))
