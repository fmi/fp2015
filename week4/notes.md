# Week 4 - Higher order functions, lambdas and lists

First, we will introduce the concept of a higher order function:

* A function that takes function as an argument
* Function is a type  - first class citizen in the language
* This gives us powerful abstraction tools to use

The idea is that we write 1 function that is abstract enough and give the user the power to provide the required data via function.

When we start working with lists, we will see the full strength of this concept.

The simplest example:

```racket
(define (calculate operation a b)
  (operation a b))
```

Here, `operation` is a function.

```racket
-> (calculate + 1 2)
3
-> (calculate - 1 2)
-1
-> (calculate square-sum 1 2)
5
```

In Racket, `+` and `-` are functions!

**A function that takes another function as an argument is called higher order function.**

When calling higher-order functions, we can provide the required function by its name.

Lets see another example:

```racket
(define (twice f x)
  (f (f x)))
```

Here, `twice` is taking a function and one argument and it is applying that function to the given argument twice.

For example:

```racket
-> (define (inc x) (+ x 1))
-> (twice inc 1)
3
```

## Lambdas

Now, the first really powerful tool in our arsenal is going to be the lambda functions.

Lambda is a function without name. Also known as anonymous function.

When we are using a higher order function, we have two choices:

1. Define the function that we want to pass and pass it by name
2. Pass a lambda function

If we need to define an entirely new function, just to use our higher order function to get some job done, we **should use a lambda function instead**

Lets see what a lambda is:

```racket
-> (lambda (x) (+ x 1))
#<procedure>
```

Okay, so a `lambda` is a function. So far so good. But there is no name? How can we call the lambda function after we have defined it? Well, there is no way.

So far, lambdas are pretty useless.

How can we use them?

One of the options are to call them directly after defining them. Woah! Lets see:

```racket
-> ((lambda (x) (+ x 1)) 1)
2
```

Wait, what? What kind of sorcery is this?

Well, we are calling our lambda right after we have defined it. And this is completely legal. We get our desired result.

Imagine it like this:

1. First, we create something. Something that will go away and cannot be used.
2. But right before it goes away, we use it.

Kind of zen. But still pretty useless, right? Right.

The real power of lambdas come in combination with higher order functions.

When a function requires another function as an argument, we can just pass a lambda! YEAH!

Lets see:

```racket
-> (twice (lambda (x) (string-append x "!")) "Racket")
"Racket!!"
-> (twice (lambda (y) (* y y y y y)) 10)
10000000000000000000000000
```

Pretty powerful stuff. We will use this a lot when we go to lists.

Now lets see functions that return functions. They are higher-order function too. Things are about to get crazy!

```racket
(define (get-operation oper)
  (cond
    [(equal? oper "+") +]
    [(equal? oper "-") -]
    [(equal? oper "*") *]
    [(equal? oper "/") /]
    [else +]))
```

So right now, as a result, we are returning functions.

Lets see:

```racket
-> (get-operation "+")
#<procedure:+>
-> ((get-operation "+") 1 2)
3
```

So we can return function from our function. But what about lambdas?

Lets try to implement a function that negates a predicate function.

For example, imagine we have the `even?` predicate. What if we want to get another function, that is the opposite of even?

```racket
-> (not even?)
#f
```

We cannot just say `not` to a function. We need to implement our negate:

```racket
(define (negate p)
  (lambda (x) (not (p x))))
```

Lambda does the magic. We return a function of one argument. And when that function is called, it returns the opposite of the result of `(p x)`

```racket
-> ((negate even) 3)
#t
```
