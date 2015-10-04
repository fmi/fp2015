# First class

Functional programming is becoming more and more important. The paradigm is finding place even in languages like C++ and Java.

We are going to study Racket & Haskell.

* Racket is a dynamically typed language from the LISP family.
* It is very different from the other languages that we know.
* We are going to talk about values, expressions and functions.

First of all, what is the purpose of a variable?

```c++
int a = 5;
a = 6;
a++;
```

We hold a value, assing it to a name and change it after this. This is the basis of our programming knowledge.

Our variables are our data. We have expressions and statements. Expressions are evaluated to values.

What is a statement? An expression with some kind of empty value.

In Racket, the first very important thing is that everything is an expression. Event `if` statements.

The most simple expressions are values themselves - `5`, `"racket"`.

Racket expressions are built using `()`:

```racket
-> (+ 1 2)
3
-> (= 1 1)
#t
-> (= 1 2)
#f
-> (if (= 1 1) 42 43)
42
```

**We use prefix notation** - it is not `(1 + 2)` but `(+ 1 2)`.

Now, to understand more about the language, we must see how we can define functions.

For example, if we want to define the simple **square** function, this is the way:

```racket
(define (square x)
  (* x x))
```

The syntax is as follows:

```racket
(define (function-name arg1 arg2 ... argn)
  (function-body-expression))
```

**The function returns the value of the `(function-body-expression)`**

Now, if we want to call the function from the REPL:

```
-> (square 2)
4
```

We use the following notation: `(function-name arg1 arg2 ... argN)`

This builds almost the entire language.

Aritmetic operations are functions:

```
-> (+ 1 2)
3
-> (* 1 2)
2
-> (- 1 2)
-1
-> (/ 1 2)
1/2
```

## Everything is an expression

If we have the following syntax for if expression:

```racket
(if
  (boolean-expression)
  (truth-expression)
  (false-expression))
```

First, the `(boolean-expression)` is evaluated to either `#t` or `#f`. Then, one of the two expressions are evaluated and the entire if expressions has the value either of the `(truth-expression)` or the `(false-expression)`

Lets see this in action - a function that takes one integer and returns `"zero"` if `(= n 0)` or `"else"`.

```racket
(define (zero-or-else? n)
  (if (= n 0)
      "zero"
      "else))
```

**As you can see, the function returns the result of the if expression.**

## Function with multiple lines

Our function is not limited to only one body expression. The rule is that the function return the result of the last body expression.

```racket
(define (square-and-print n)
  (display "I am squaring")
  (* n n))
```

There the result of the function is going to be the result of the last expression `(* n n)`

Suck functions are called functions with side effects. This is a big topic and we are going to discuss it later. For now, we are going to to only functions with one body expression.

## Cond expression

Now, we have the `if` statement. But if we like to do multiple checks, there is a better expression - `cond`.

```racket
(cond
  [(check-rule-expression) (expression-to-evaluate-if-check-rule-is-true)]
  [(check-rule-expression2) (expression-if-check-rule-is-true)]
  ...
  [else (else-expression)])
```

This can work as your normal `switch` statement in different languages.

The `cond` expression returns the first expression which check-rule holds true.

For example:

```racket
(define (traffic-light color)
  (cond
    [(equal? color "red") "stop"]
    [(equal? color "yellow") "prepare"]
    [(equal? color "green") "go"]
    [else "sorry, no idea."]))
```

## Recursion

Now, if we want to solve some problems, we need to rely on our good old friend - recursion. We are going to build an expression in our recursion which in the end is going to be evaluated to the proper value.

For example, here is a function that finds the factorial of n:

```racket
(define (fact n)
  (cond
    [(= n 0) 1]
    [else (* n (fact (- n 1)))]))
```

The magic here is the recursion part: `(* n (fact (- n 1)))`.

Lets see how this works:

```
(fact 5) =
(* 5 (fact 4)) =
(* 5 (* 4 (fact 3))) =
(* 5 (* 4 (* 3 (fact 2)))) =
(* 5 (* 4 (* 3 (* 2 (fact 1))))) =
(* 5 (* 4 (* 3 (* 2 (* 1 (fact 0)))))) =
(* 5 (* 4 (* 3 (* 2 (* 1 1))))) =
(* 5 (* 4 (* 3 (* 2 1)))) =
(* 5 (* 4 (* 3 2))) =
(* 5 (* 4 6)) =
(* 5 24) =
120
```

The recursion is actually building one expression. The end of the recursion triggers the evaluation of the expression.

With this knowledge, now we can solve some problems.
