(define (square x)
  (* x x))

(define (square-sum a b)
  (+ (square a) (square b)))

(define (triangle? a b c)
  (and
    (> (+ b c) a)
    (> (+ a b) c)
    (> (+ a c) b)))

(define (pyth? a b c)
  (= (square c) (square-sum a b)))

; Факториел, написан чрез if
(define (fact2 n)
  (if
    (zero? n)
    0
    (* n (fact2 (- n 1)))))

; Факториел, написан чрез cond
(define (fact n)
  (cond
    [(zero? n) 1]
    [else (* n (fact (- n 1)))]))

(define (cut-last-digit n)
  (remainder n 10))

(define (cut-number-from-last-digit n)
  (quotient n 10))

; Използваме по-хубави имена за функциите remainder и quotient
; Така разбираме какво се случва
(define (sum-digits n)
  (cond
    [(zero? n) 0]
    [else (+ (cut-last-digit n) (sum-digits (cut-number-from-last-digit n)))]))
