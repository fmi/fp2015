# Homework 1

Implement each problem in a separate `.rkt` file.

## Product of digits

Implement a racket function that finds the product of digits of a number.

```racket
(define (product-digits n)
  ...)
```

Here are few examples:

```
-> (product-digits 123)
6
-> (product-digits 12345)
120
-> (product-digits 12355430)
0
```

## Circle

Implement a racket predicate called `circle?` that checks if a point is inside / on a circle.

The predicate should take 5 arguments -

* `(point-x, point-y)` - the coordinates of the point.
* `(circle-x, circle-y)` - the coordinates of the center of the circle
* `radisu` - the radius of the circle.

```racket
(define (circle? circle-x circle-y radius point-x point-y)
  ...)
```

The formula that must be satisfied is:

```
(point-x - circle-x)^2 + (point-y - circle-y)^2 <= radius^2
```

Everthing is happening on a [Cartesian coordinate system](https://en.wikipedia.org/wiki/Cartesian_coordinate_system)

Here are few examples:

```
-> (circle? 0 0 3 2 2)
#t
-> (circle? 0 0 5 3 3)
#t
-> (circle? 0 0 3 4 3)
#f
-> (circle? 10 10 3 11 12)
#t
-> (circle? 10 10 3 11 13)
#f
```

## Area of triangle

Implement a Racket function that calculates the area of a given triangle using [Heron's formula](https://en.wikipedia.org/wiki/Heron%27s_formula).

```racket
(define (area a b c)
  ...)
```

This one is easy. You will figure it out ;)

## Prime number

Implement a Racket predicate that cheks if a given number is prime.

```racket
(define (prime? n)
  ...)
```

[Here is a list of prime numbers to test with](https://primes.utm.edu/lists/small/1000.txt)

## Cube sums

Implement a Racket predicate called `cube-sums?` that takes one integer `n` and returns `#t` if there are any two integers `a` and `b` which has the following property:

```
n = a^3 + b^3
```

```racket
(define (cube-sums? n)
  ...)
```

For example, lets see few numbers with cube sums:

```
2 = 1^3 + 1^3
9 = 2^3 + 1^3
16 = 2^3 + 2^3
91 = 4^3 + 3^3
1729 = 9^3 + 10^3
87539319 = 167^3 + 436^3
```

**Extra credit**

Implement a Racket function called `(count-cube-sums from to)` which counts how many numbers satisfy the `cube-sums?` predicate between `[from, to]`
