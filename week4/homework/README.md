# Homework 4

Homework on higher order functions.

## Highest order

Implement a function `f` that takes 3 arguments - a predicate `p` and two more functions - `g` and `h`. All function arguments are functions with one argument.

`f` should return a function with a single argument.

When the returned function is called, it should return `#t` if both `p(g(x))` and `p(h(x))` are true. `#f` should be returned otherwise.

`x` is the argument of the returned from `f` function.

Examples:

```racket
-> (f even? add1 add1)
<procedure>
-> ((f even? add1 add1) 1)
#t
-> ((f prime? (lambda (x) x) square) 7)
#f
```

## Fractions

[Using Pairs in Racket](http://docs.racket-lang.org/guide/Pairs__Lists__and_Racket_Syntax.html), implement the following functions to work with fractions.

We are going to represent a fraction with a pair.

Here is how you can create a pair:

```racket
-> (cons 1 2)
'(1 . 2)
-> (define a (cons 1 2))
-> a
'(1 . 2)
```

In order to get the first and the second element, and for better naming, you can use the following functions:

```racket
(define (fst pair)
  (car pair))

(define (snd pair)
  (cdr pair))
```

You can use them like that:

```racket
-> (define a (cons 1 2))
-> (fst a)
1
-> (snd a)
2
```

With that in mind, give implementation to the following functions to work with fractions:

```racket
; You should add two fractions together and return a new fraction
(define (add-frac frac1 frac2)
  (void))

; You should subtract two fractions together and return a new fraction
(define (substract-frac frac1 frac2)
  (void))

; You know the drill by now. Multiply and return a new fraction
(define (mult-frac frac1 frac2)
  (void))

; Simplify, if possible, the given fraction
; https://www.mathsisfun.com/simplifying-fractions.html
(define (simplify-frac frac)
  (void))
```

Everywhere, `(void)` means that the function does nothing. Replace `(void)` with proper implementation.

## Prepare for lists

The last problem is to read and play with the materials about lists in Racket - <http://docs.racket-lang.org/guide/Pairs__Lists__and_Racket_Syntax.html>

Be ready. Try everything out.
