#lang racket

; Да се изчисли факториелът на даденото число n.
; Обикновеното рекурсивно решение заема много памет във
; функционалния стек, докато опашковата рекурсия
; ни я спестява - дори да не води до подобрения в скоростта.
(define (fact n)
  ;(if (< n 2) 1
  ;    (+ n (fact (- n 1))))
  
  (define (fact-iter1 i result)
    (if (> i n) result
        (fact-iter1 (+ i 1) (* result i)))
  )

  (define (fact-iter2 n result)
    (if (< n 2) result
        (fact-iter2 (- n 1) (* result n)))
  )
  
  ;(fact-iter1 1 1)
  (fact-iter2 n 1)
)

; Да се изчисли n-тото число на Фибоначи.
; Тук рекурсивното решение е ужасно бавно, освен че
; заема много памет. Итеративното решение решава и
; двата проблема и е вторият най-бърз начин за решаване
; на тази задача. (hint: бързо степенуване на матрици)
(define (fib n)
  ;(if (< n 3) 1
  ;    (+ (fib (- n 1)) (fib (- n 2))))
  
  (define (fib-iter a b i)
    (if (> i n) b
        (fib-iter b (+ a b) (+ i 1)))
  )
  (fib-iter 1 1 3)
)

; Да се намери сумата от цифрите на дадено число.
(define (sum-of-digits n)
  ;(if (< n 10) n
  ;    (+ (remainder n 10) (sum-of-digits (quotient n 10))))
  
  (define (sum-iter n result)
    (if (< n 10) (+ n result)
   ;(if (= n 0) result <- алтернативно дъно
        (sum-iter (quotient n 10) (+ result (remainder n 10))))
  )
  (sum-iter n 0)
)

; Да се намери сумата на целите числа в целочислен интервал.
(define (sum-in-range a b)
  ;(if (> a b) 0 (+ a (sum-in-range (+ a 1) b)))
  
  (define (sum-iter i result)
    (if (> i b) result
        (sum-iter (+ i 1) (+ i result)))
  )
  (sum-iter a 0)
)

; Да се намери сборът на всички делители на дадено число.
(define (sum-divisors n)
  (define (sum-iter i result)
    (cond [(> i n) result]
          [(= (remainder n i) 0) (sum-iter (+ i 1) (+ result i))]
          [else (sum-iter (+ i 1) result)])
  )
  (sum-iter 1 0)
)

; Да се провери дали дадено число е просто
; Почти винаги трябва да внимаваме за единицaта и,
; ако трябва, да я изолираме в отделна проверка -
; тя не е нито просто, нито съставно число!
;
; Можем и съществено да подобрим скоростта, като
; ограничим търсенето на делители до (sqrt n), тъй като
; ако съществуват делители, то един от тях със сигурност
; ще бъде <= (sqrt n).
(define (prime? n)
  ;(= (sum-divisors n) (+ n 1))
  
  (define (prime-iter i)
    (cond [(>= i n) #t]
          [(= (remainder n i) 0) #f]
          [else (prime-iter (+ i 1))])
  )
  (if (= n 1) #f (prime-iter 2)) ; почти винаги трябва да внимаваме за единицата
)

; Да се обърнат цифрите на дадено число.
; Изненадващо, работи вярно и за отрицателни числа!
(define (reverse-int n)
  (define (rev-iter n result)
    (if (= n 0) result
        (rev-iter (quotient n 10) (+ (* result 10) (remainder n 10))))
  )
  (rev-iter n 0)
)
