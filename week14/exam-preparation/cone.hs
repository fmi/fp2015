data Tree a = Empty | Node a (Tree a) (Tree a)

exampleTree :: Tree Int
exampleTree = (Node 5 (Node 4 (Node 10 Empty Empty) Empty) (Node 3 (Node 11 Empty Empty) Empty))

-- inorder / preorder / postorder traversals
flattenTree :: Tree a -> [a]
flattenTree Empty = []
flattenTree (Node x left right) = (flattenTree left) ++ [x] ++ (flattenTree right)

instance Show a => Show (Tree a) where
  show tree = show $ flattenTree tree

countNodes :: Tree a -> Int
countNodes Empty = 0
countNodes (Node x left right) = 1 + (countNodes left) + (countNodes right)

treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node x left right) = 1 + max (treeHeight left) (treeHeight right)

treeLevel :: Int -> Tree a -> [a]
treeLevel level tree = helper 1 level tree
  where
    helper _ _ Empty = []
    helper currentLevel desiredLevel (Node x left right)
      | currentLevel == desiredLevel = [x]
      | otherwise = (helper (currentLevel + 1) desiredLevel left) ++ (helper (currentLevel + 1) desiredLevel right)

-- Връща списък от всички нива на дървото
treeLevels :: Tree a -> [[a]]
treeLevels tree = map (flip treeLevel $ tree) [1 .. (treeHeight tree)]

-- без flip магията
treeLevels' :: Tree a -> [[a]]
treeLevels' tree = map (\level -> treeLevel level tree) [1 .. (treeHeight tree)]

treeFind :: Eq a => a -> Tree a -> Bool
treeFind _ Empty = False
treeFind needle (Node x left right)
  | needle == x = True
  | otherwise = (treeFind needle left) || (treeFind needle right)

bstInsert :: Ord a => a -> Tree a -> Tree a
bstInsert element Empty = (Node element Empty Empty)
bstInsert element (Node x left right)
  | element == x = (Node x left right)
  | element < x = (Node x (bstInsert element left) right)
  | otherwise = (Node x left (bstInsert element right))

bstFind :: Ord a => a -> Tree a -> Bool
bstFind _ Empty = False
bstFind element (Node x left right)
  | element == x = True
  | element < x = bstFind element left
  | otherwise = bstFind element right

isEmpty :: Tree a -> Bool
isEmpty Empty = True
isEmpty _ = False

isLeaf :: Tree a -> Bool
isLeaf Empty = False
isLeaf (Node _ left right) = isEmpty left && isEmpty right 

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap _ Empty = Empty
treeMap f (Node x left right) = Node (f x) (treeMap f left) (treeMap f right)

countLeaves :: Tree a -> Int
countLeaves Empty = 0
countLeaves (Node _ Empty Empty) = 1
countLeaves (Node _ left right) = (countLeaves left) + (countLeaves right)

-- 0, 1 or 2
successorsCount :: Tree a -> Int
successorsCount Empty = 0
successorsCount (Node _ (Node _ _ _) Empty) = 1
successorsCount (Node _ Empty (Node _ _ _)) = 1
successorsCount (Node _ (Node _ _ _) (Node _ _ _)) = 2
successorsCount  _ = 0

levelSum :: Int -> Tree Int -> Int
levelSum level tree = sum $ treeLevel level tree

isIncreasing [] = True
isIncreasing [x] = True
isIncreasing (x:y:xs) = x < y && isIncreasing (y:xs)

cone :: Tree Int -> Bool
cone Empty = False
cone tree = isIncreasing $ map sum $ treeLevels tree












