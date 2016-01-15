data Tree a = Empty | Node a (Tree a) (Tree a)

exampleTree :: Tree String
exampleTree = Node "F" 
                (Node "B" 
                  (Node "A" Empty Empty) 
                  (Node "D"
                    (Node "C" Empty Empty)
                    (Node "E" Empty Empty))) 
                (Node "G"
                  Empty 
                  (Node "I" 
                    (Node "H" Empty Empty) Empty))
