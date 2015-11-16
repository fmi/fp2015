# Homework 7 - Tree problems

## Tree levels

Implement the following Racket functions:

```racket
(define (tree-level level tree)
  (void))

(define (tree-levels tree)
  (void))
```

The first function takes a `level`, a binary `tree` and returns a list of all emenents that are located on that same level of the tree. Start counting levels from 1.

The second function takes a binary `tree` and returns a list of lists of all elemenets on every level of the tree. The `ith` element of the returned list should be the elements on the `ith` level of the `tree`

Examples:

```racket
(define t
  (make-tree 1
    (make-tree 2
      (make-leaf 5)
      (make-leaf 6))
    (make-leaf 3)))

-> (tree-level 1 t)
'(1)
-> (tree-level 2 t)
'(2 3)
-> (tree-level 3 t)
'(5 6)
-> (tree-levels t)
'((1) (2 3) (5 6))
```

## Map a Tree

Implement the following Racket function:

```racket
(define (tree-map f tree)
  (void))
```

The function takes a single argument funciton `f` and ` binary `tree` and returns a new tree, where every node is transformed by `f`

Example:

```racket
(define t
  (make-tree 1
    (make-tree 2
      (make-leaf 5)
      (make-leaf 6))
    (make-leaf 3)))

-> (tree-map add1 t)

'(2
    (3
        (6 () ())
        (7 () ()))
    (4 () ()))
```

## Binary Search Tree

Implement the following functions that work on [binary search trees](https://en.wikipedia.org/wiki/Binary_search_tree)

```racket
; Inserts x in the tree, returning a new BST with the proper structure
(define (bst-insert x tree)
  (void))

; Checks if x is an element of tree
(define (bst-element? x tree)
  (void))

; Traverse the tree in a such way that the list should contain sorted elements
(define (bst->list tree)
  (void))

; Checks if the given binary tree is a binary search tree
(define (bst? tree)
  (void))
```
