import Data.List

sortAsc :: Ord a => [a] -> [a]
sortAsc = sort

sortDesc :: Ord a => [a] -> [a]
sortDesc = reverse . sort

intToList :: Int -> [Int]
intToList n
  | n < 10 = [n]
  | otherwise = intToList (n `div` 10) ++ [n `mod` 10]

listToInt :: [Int] -> Int
listToInt xs = foldl glue 0 xs
  where
    glue a b = a*10 + b

sumDigits :: Int -> Int
sumDigits = sum . intToList

unique :: Ord a => [a] -> [a]
unique = (map head) . group . sort

removeZeroes :: [Int] -> [Int]
removeZeroes = filter (/=0)

mergeAndSortDigits :: Int -> Int -> Int
mergeAndSortDigits x y
  | sumDigits x <= sumDigits y = listToInt $ sortAsc merged
  | otherwise = listToInt $ sortDesc merged
    where
      merged = removeZeroes . unique $ (intToList x ++ intToList y)











