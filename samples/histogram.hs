import Data.List

-- програмата чете файл
-- и изкарва на екрана хистограма на думите му


-- pure part

sortGT (w1, c1) (w2, c2)
  | c1 < c2 = GT
  | c1 > c2 = LT
  | c1 == c2 = compare w1 w2

histogram :: [String] -> [(String, Int)]
histogram allWords = sortBy sortGT $ map (\g -> (head g, length g) ) $ group $ sort allWords

singleHistResultToString :: (String, Int) -> String
singleHistResultToString (word, count) = concat [word, " - ", (show count)]

-- impure part

main = do
  fileName <- getLine
  contents <- readFile fileName
  let 
    allWords = histogram $  words contents
    preparedForPrint = map singleHistResultToString allWords
  mapM_ putStrLn preparedForPrint -- mapM_ map-ва IO функция върху списък от неща (В случая, String-ове)

