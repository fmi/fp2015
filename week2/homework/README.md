# Homework 2

**Use tail call recursion whenever is applicable!**

## Series

In a file called `series.rkt` implement the following functions:

### `(series a b n)`

This function should return the nth member of the series that follow the pattern:

```
A1 = a
A2 = b
An = An-1 + An-2
```

For example, if `a = 1` and `b = 1`, we are going to get the Fibonacci series. If `a = 2` and `b = 1`, we are going to get the Lucas series.


Example usage in xREPL:

```racket
-> (series 1 1 10)
55
-> (series 2 3 10)
144
-> (series 2 1 10)
76
```

### `(lucas n)` and `(fibonacci n)`

Using the `series` function, implement the following functions:

* `(lucas n)` which returns the nth member of the Lucas series.
* `(fibonacci n)` which returns the nth member of the Fibonacci series.

### `(summed-member n)`

Next, implement the `(summed-member n)` function which returns the sum of the nth member of Lucas and nth member of Fibonacci series.

This means the following equation:

```
summed-member(n) = lucas(n) + fibonacci(n)
```

Examples:

```racket
-> (summed-member 1)
3
-> (summed-member 10)
131
-> (summed-member 666)
16338755146995029054736715627911135966526116743682459603796713422641127612695004111733680782579831725266145312163877373516554992667286371099
```

### Nth sums

Next, implement the two functions:

* `(nth-lucas-sum n)`
* `(nth-fibonacci-sum n)`

Both functions should return the sum of all members from the first to the nth one.

For example, `(nth-lucas-sum 10)` means that we want to sum all Lucas numbers from the 1st to the 10th, inclusive.

Examples:

```racket
-> (nth-fibonacci-sum 10)
143
-> (nth-lucas-sum 10)
198
```

### The difference series

And finally, implement a function called `(lucas-fib-diff n)` which returns the nth member of the special series, which is formed like this:

```
A1 = lucas(1) - fib(1)
...
AN = lucas(n) - fib(n)
```

The nth member of the desired series is the difference between the nth member of the Lucas series adn the nth member of Fibonacci.

Examples:

```racket
-> (lucas-fib-diff 1)
1
-> (lucas-fib-diff 10)
21
```

## Number fencing

In a file, called `fence.rkt` implement the following functions:

### `(string-repeat str n)`

This function should take a string and concatenate it with itself `n` times.

Examples:

```racket
-> (string-repeat "-" 1)
"-"
-> (string-repeat "-" 2)
"--"
-> (string-repeat "racket" 3)
"racketracketracket"
```

In order to achieve your goal, you will have to use `(string-append a b)` from the standard library:

```racket
-> (string-append "ra" "cket")
"racket"
```

### `(fence n)`

We are going to put number in fences. Fences represent a string that looks something like this:

```
{-->n<--}
```

All fences must start with `{` and end with `}`. Around the number `n` there must always be `>` and `<`.

The only thing of variable length are the dashes.

For a number `n`, we know that the left and right fence must have the following number of dashes:

```racket
(round (+ 1 (log n)))
```

Build the fence and return it as a string. Here are some examples:

```racket
-> (fence 1)
"{->1<-}"
-> (fence 2)
"{-->2<--}"
-> (fence 10)
"{--->10<---}"
-> (fence 100)
"{------>100<------}"
```

## Binary stuff

In a file, called `binary.rkt`, implement the following functions:

### `(string-reverse str)`

Implement the generic string reverse function.

In order to achieve that, you will have to use few string functions from the standard library:

```racket
-> (string-length "racket")
6
-> (string-append "ra" "cket")
"racket"
-> (string-ref "racket" 0)
  #\r
-> (string-ref "racket" 1)
#\a
-> (string-append "a" (string-ref "a" 0))
; string-append: contract violation
;   expected: string?
;   given: #\a
;   argument position: 2nd
; [,bt for context]
-> (~a (string-ref "a" 0))
"a"
-> (string-append "a" (~a (string-ref "a" 0)))
"aa"
```

Examples for string reverse:

```racket
-> (string-reverse "racket")
"tekcar"
-> (string-reverse "kapak")
"kapak"
```

### `(to-binary-string n)`

Implement a function, that takes an integer `n` and returns the binary representation of `n` as a string.

If you want to turn a number into string, you can use `(~a n)`

Examples:

```racket
-> (to-binary-string 1)
"1"
-> (to-binary-string 10)
"1010"
-> (to-binary-string 8)
"1000"
-> (to-binary-string 111)
"1101111" 
```

### `(from-binary-string binary-str)`

Implement a function, that takes a binary string representation and returns the integer number from it.

If you want to turn a string into a number, you can use the function from the standard library:

```racket
-> (string->number "111")
111
```

Here are examples:

```racket
-> (from-binary-string "1101111")
111
-> (from-binary-string "0")
0
-> (from-binary-string "1")
1
-> (from-binary-string "10")
2
-> (from-binary-string "11")
3
-> (from-binary-string "100")
4
-> (from-binary-string "101010")
42
```
