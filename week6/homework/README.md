# Homework 6

## group

Implement the following Racket function, that groups consecutive equal elements into sub-lists:

```racket
-> (group (list 1 1 1 2 3 1 2 2))
'((1 1 1) (2) (3) (1) (2 2))
-> (group (list 1 2 3 4 5 6))
'((1) (2) (3) (4) (5) (6))
-> (group (list 1 1 1 1 1 1))
'((1 1 1 1 1 1))
-> (group (list))
'()
```

## Run-length encoding and decoding

Implement the simple [run-length encoding algorithm for string compresion](https://en.wikipedia.org/wiki/Run-length_encoding)

The algorithm groups consecutive equal chars in one string into the format `{N}{C}` where `{N}` is the number of consequtive repeats of the char `{C}`.

If `{N}` is equal to 1, skip this `{N}` and don't add it in the encoding'

For example, if we have the string `"aaaa"`, the run-legth encoding is `"4a"`.

Here are examples:

```racket
-> (run-length-encode "Racket")
"Racket"
-> (run-length-encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW"
"12W1B12W3B24W1B14W"
-> (run-length-encode "baaabaaa")
"b3ab3a"
```

After this, implement the decoding function, that takes an already encoded string and returns the original value:

```racket
-> (run-length-decode "Racket")
"Racket"
-> (run-length-decode "12W1B12W3B24W1B14W")
"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW"
-> (run-length-decode "b3ab3a")
"baaabaaa"
```

