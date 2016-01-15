import Data.List

maxList :: Ord a => [a] -> a
maxList = foldl1 max 

step :: Int -> [Int] -> Bool
step n xs = sum xs <= n

balance :: Int -> [Int] -> Int
balance n xs = helper n sorted
   where
      sorted = reverse $ sort xs
      helper _ [] = 0
      helper limit (y:ys)
        | step n (y:ys) = 0
        | otherwise = 1 + helper n ys 
