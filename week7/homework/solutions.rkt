(define (tree-map f tree)
  (cond
    [(empty? tree) tree]
    [else (make-tree (f (root tree)) (tree-map f (left tree)) (tree-map f (right tree)))]))


(define (tree-level level tree)
  (cond
    [(empty? tree) (list)]
    [(= level 1) (list (root tree))]
    [else (append (tree-level (- level 1) (left tree)) (tree-level (- level 1) (right tree)))]))

(define (all-levels tree)
  (map (lambda (level) (tree-level level tree))
       (range 1 (add1 (max-level tree)))))

(define (bst-insert x tree)
  (cond
    [(empty? tree) (make-leaf x)]
    [(= x (root tree)) tree]
    [(< x (root tree)) (make-tree (root tree) (bst-insert x (left tree)) (right tree))]
    [(> x (root tree)) (make-tree (root tree) (left tree) (bst-insert x (right tree)))]))
