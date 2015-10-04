# Homework

## Product of digits

Implement a racket function that finds the product of digits of a number.

```racket
(define (product-digits n)
  ...)
```

## Circle

Implement a racket predicate called `circle?` that checks if a point lies within a circle.

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

## Area of triangle

Implement a Racket function that calculates the area of a given triangle using [Heron's formula](https://en.wikipedia.org/wiki/Heron%27s_formula).

```racket
(define (area a b c)
  ...)
```

## Prime number

Implement a Racket predicate that cheks if a given number is prime.

```racket
(define (prime? n)
  ...)
```

## Cube sums

Implement a Racket predicate called `cube-sums?` that takes one integer `n` and returns `#t` if there are any to integers `a` and `b` which has the following property:

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
1729 = 9^3 + 10^3
87539319 = 167^3 + 436^3
```
