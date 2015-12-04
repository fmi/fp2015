(define (half-perimeter a b c)
  (/ (+ a b c) 2))

(define (area a b c)
  (let*
    ([p (half-perimeter a b c)]
     [pa (- p a)]
     [pb (- p b)]
     [pc (- p c)])
    (sqrt (* p pa pb pc))))
