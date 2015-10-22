# Homework 3

Before diving into lists and higher order functions, we are going to do some final things with numbers.

Use everything you know up until now. Use either standard or tail-call recursion. Reuse functions that you have already implemented.

It is a good idea to reuse code by using [Racket modules](http://docs.racket-lang.org/guide/module-basics.html)

With modules, we can load racket file from another Racket file and use the functions defined there.

Here is an example (code provided in the homework folder)

Lets have `math.rkt` file:

```racket
#lang racket

(provide
  square)

(define (square x) (* x x))
```

The magic here is the call to the `provide` function, coming from the Racket language. We **export** our square to whoever requires us.

Lets have a `program.rkt` file, located in the same folder as `math.rkt`:

```racket
#lang racket

(require "math.rkt")

(define (main)
  (println (square 2)))

(main)
```

As you can see, we use the `require` function to get our file. This gives us all **provided** functions.

Now, if we run the program:

```
$ racket program.rkt
4
```

Try using modules to solve this homework.

## Nth Beast Number

666 is the first number of the beast.

If we want to get the next number, we must repeat the three 6's again. So the second number of the beast is 666666

Implement a function, called `(nth-beast-number n)`, which returns the nth number of the beast.

Examples:

```racket
-> (nth-beast-number 1)
666
-> (nth-beast-number 2)
666666
-> (nth-beast-number 3)
666666666
```

## Hack Numbers

A hack number is an integer, that matches the following criteria:

* The number, represented in binary, is a palindrome
* The number, represented in binary, has an odd number of 1's in it

Example of hack numbers:

* 1 is `1` in binary
* 7 is `111` in binary
* 7919 is `1111011101111` in binary

Implement a function, called `(next-hack n)` that takes an integer and returns the next hack number, that is bigger than `n`


Few examples:

```racket
-> (next-hack 0)
1
-> (next-hack 10)
21
-> (next-hack 8031)
8191
```

## Palindrome Score

We denote the "Palindrome score" of an integer by the following function:

* `P(n) = 1`, if `n` is palindrome
* `P(n) = 1 + P(s)` where `s` is the sum of `n` and the `reverse of n`

Implement a function, called `(p-score n)`, which finds the palindrome score for `n`.

Lets see two examples:

* `p_score(121) = 1`, because `121` is a palindrome.
* `p_score(48) = 3`, because: 

1. `P(48) = 1 + P(48 + 84) = 132`
2. `P(132) = 1 + 1 + P(132 + 321 = 363)`
3. `P(363) = 1`.
4. When we return from the recursion, we get 3.

Here are function call examples:

```racket
-> (p-score 121)
1
-> (p-score 48)
3
-> (p-score 198)
6
```

