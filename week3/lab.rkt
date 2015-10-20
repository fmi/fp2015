#lang racket
; Обръщане на цифрите на числото n
(define (reverse-int n)
  (define (rev-iter n result)
    (cond [(= n 0) result]
          [else (rev-iter (quotient n 10) (+ (* result 10) (last-digit n)))]))
  (rev-iter n 0))

; Най-простата проверка дали едно число е палиндром -
; дали е равно на своето "обърнато"
(define (palindrome? n)
  (= n (reverse-int n)))

; Бърза и проста функция за повдигане на квадрат
(define (sq x) (* x x))

; "Бърза" експонента - извършваща изчисленията за
; O(logn) време. Итеративно решение съществува, но е
; твърде грозно и сложно за разписване.

; От друга страна, програма, която изразходва O(logn)
; памет в стека, не би трябвало да доведе до stack overflow
; в никакви ситуации, което обезсмисля донякъде
; итеративните реализации и на функции като reverse-int,
; increasing?, occurences и contains-digits? -
; освен за образователни цели, естествено ;)
(define (fast-exponent x n)
  (cond [(= n 0) 1]
        [(odd? n) (* x (fast-exponent (sq x) (quotient n 2)))]
        [else (fast-exponent (sq x) (quotient n 2))]))

; Доработка на функцията за бърза експонента, която
; подобно на вградената expt изчислява коректно всякакви степени:
; (fast-exponent* 2 5) -> 32
; (fast-exponent* 2 -5) -> 1/32
; (fast-exponent* 2 1/2) -> 1.4142135623730951
; (fast-exponent* 2 -1/2) -> 0.7071067811865475
; (fast-exponent* 2 0) -> 1
; (fast-exponent* 2 (exp 1)) -> 6.5808859910179205
;
; --- ВАЖНО: тази функция е само за демонстративни цели и за
; "любопитните", по никакъв начин не бива да я считате за
; примерно написана функция. Малко е overkill и е далеч от
; целите на този курс. ---
;
(define (fast-exponent* x n)
  (cond [(negative? n) (/ (fast-exponent* x (- n)))]
        [(integer? n) (fast-exponent x n)]
        [else (* (fast-exponent x (floor n))
                 (expt x (- n (floor n))))]))

; Сбор на всички делители на дадено число
(define (sum-divisors n)
  (define (sum-iter i result)
    (cond [(> i n) result]
          [(= (remainder n i) 0) (sum-iter (+ i 1) (+ result i))]
          [else (sum-iter (+ i 1) result)]))
  (sum-iter 1 0))

; Проверка дали дадено число е съвършено,
; т.е. сбора на всичките му делители (без себе си)
; е равен на самото число
; 6 = 1+2+3 -> #t
; 28 = 1+2+4+7+14 -> #t
; 33550336 = 1+2+...+8387584+16775168 -> #t
(define (perfect? n)
  (= (sum-divisors n) (* n 2)))

; Малки, порсти функции за взимане на последните
; две цифри на дадено число
(define (last-digit n) (remainder n 10))
(define (second-last-digit n) (last-digit (quotient n 10)))

; Три примера за функции, които нямат нужда от помощ,
; за да реализират опашкова рекурсия. Естествено, това
; са само примерни реализации, на първо място е важна коректността.
(define (increasing? n)
  (cond [(< n 10) #t]
        [(< (second-last-digit n) (last-digit n)) (increasing? (quotient n 10))]
        [else #f]))

(define (occurrences a n)
  (define (occ-iter n result)
    (cond [(= n 0) result]
          [(= (remainder n 10) a) (occ-iter (quotient n 10) (+ result 1))]
          [else (occ-iter (quotient n 10) result)]))
  (occ-iter n 0))

(define (contains-digits? x y)
  (cond [(< x 10) (positive? (occurrences x y))] ; трябва да внимаваме за (contains-digits? 0 123)
        [(positive? (occurrences (last-digit x) y)) (contains-digits? (quotient x 10) y)]
        [else #f]))
