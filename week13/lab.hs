import Data.List (isInfixOf)
import Data.Char (toLower)

-- Създаванме типове синоним
type Product = (String, Double)

getName :: Product -> String
getName (name, _) = name

getPrice :: Product -> Double
getPrice (_, price) = price

-- Използваме fromIntegral, за да може да разделим Int на Double
discount :: Int -> [Product] -> [Product]
discount percent products = map discountPrice products
  where
    discountPrice (name, price) = (name, price - (price * (fromIntegral percent / 100.0)))

products :: [Product]
products = [("Laptop", 1000.0)]
 
data Shape = Circle | Triangle | Rectangle

-- Добавяме наши тип в типовия клас Show
-- Това е същото като .toString() методите в повечето други езици
-- Важното е да запомни,, че правим Pattern Matching по Value Constructors на типа!
instance Show Shape where
  show Circle = "Circle"
  show Triangle = "Triangle"
  show Rectangle = "Rectangle"

-- Добавяме нашия нов тип в класа Eq, за да може да сравняваме между различните форми
instance Eq Shape where
  (==) Circle Circle = True
  (==) Triangle Triangle = True
  (==) Rectangle Rectangle = True
  (==) _ _ = False -- това е известно като "catch-all pattern", за да не описване всички други False случаи


-- Сега тази функция ще може да работи и за нашият нов Shape тип, тъй като го добавихме в Eq класа!
-- Пробвайте search Circle [Circle, Rectangle, Triangle]
search :: (Eq a) => a -> [a] -> Bool
search _ [] = False
search needle (x:xs)
  | x == needle = True
  | otherwise = search needle xs

-- Задачата с векторите
-- Тук имаме value constructor, който е със същото име като името на типа
data Vector2D = Vector2D Double Double

instance Show Vector2D where
  show (Vector2D x y) = "Vector2D::" ++ show (x,y)

instance Eq Vector2D where
  (==) (Vector2D x1 y1) (Vector2D x2 y2) = x1 == x2 && y1 == y2

addVectors :: Vector2D -> Vector2D -> Vector2D
addVectors (Vector2D x1 y1) (Vector2D x2 y2) = Vector2D (x1 + y1) (x2 + y2)

vectorLength :: Vector2D -> Double
vectorLength (Vector2D x y) = x^2 + y^2

data Book = Paper String Int | Online String Int Int
type Library = [Book]

instance Show Book where
  show (Paper title pages) = "Paper book::" ++ title ++ " with pages: " ++ show pages
  show (Online title price pages) = "Online book::" ++ title ++ " with pages: " ++ show pages ++ " and cost: " ++ show price

getPages :: Book -> Int
getPages (Paper _ pages) = pages
getPages (Online _ _ pages) = pages

getTitle :: Book -> String
getTitle (Paper title _) = title
getTitle (Online title _ _) = title

getTotalPages :: Library -> Int
getTotalPages library = sum $ map getPages library

isPaper :: Book -> Bool
isPaper (Paper _ _) = True
isPaper _ = False

isOnline :: Book -> Bool
isOnline (Online _ _ _) = True
isOnline _ = False

getOnlineCount :: Library -> Int
getOnlineCount library = length $ filter isOnline library

getPaperCount :: Library -> Int
getPaperCount library = length $ filter isPaper library

-- Използваме вградената функция isInfixOf
-- http://hackage.haskell.org/package/base-4.7.0.2/docs/Data-List.html#v%3aisInfixOf
isBookLike :: String -> Book -> Bool
isBookLike subtitle book = isInfixOf lowerNeedle lowerHaystack
  where
    lowerNeedle = map toLower subtitle
    lowerHaystack = map toLower (getTitle book)

getBooksLike :: String -> Library -> Library
getBooksLike searchTerm library = filter (isBookLike searchTerm) library

library :: Library
library = [Paper "Harry Potter and the Half Blood Prince" 100, Paper "Pragmatic Thinking and Learning" 100,
           Online "The Healthy Programmer" 30 100, Paper "Hogfather" 100]


indexOf :: Eq a => a -> [a] -> Maybe Int
indexOf needle xs = helper needle (index xs)
  where
    index xs = zip [0 .. ((length xs) - 1)] xs
    helper _ [] = Nothing
    helper needle ((index, x):xs)
      | needle == x = Just index
      | otherwise = helper needle xs
