import Data.Char

-- map, filter, foldl
-- Curry functions
-- Function composition - (.)
-- Function identity - ($)
-- Sections - (+1), (==2), (>8)
-- twice
-- trim
-- quickSort

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ z [] = z
foldl' op z (x:xs) = foldl' op z' xs
  where
    z' = op z x

-- Това е функция, като ($) в Haskell
fId :: (a -> b) -> a -> b
fId f x = f x

-- Композиция на функции в Haskell, което е функцията (.)
compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f $ g x

-- Функцията вика f - функция на два аргумента, два пъти
-- Обърнете внимание как сме изпуснали вторият аргумент ;)
twice :: (a -> a) -> a -> a
twice f = f . f

trim :: String -> String
trim = f . f
    where
        f = reverse. dropWhile isSpace

-- имплементация на quickSort
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort lesser ++ [x] ++ quickSort greater
    where
        lesser = filter (< x) xs
        greater = filter (>= x) xs
