-- програмта приема име на файл като вход
-- чете файла и изкарва броя на редовете, които се срещат в него

-- pure part

countLines :: String -> Int
countLines str = length $ lines str 


-- impure part

-- тук имаме собствена функция, която е impure
-- тя връща IO String, като използва bind оператор (>>=), за да направи следното :
-- първо прочита един ред от getLine и веднага дава String-овата стойност като аргумент на readFile
-- readFile от своя страна връща IO String
getFileContents :: IO String
getFileContents = getLine >>= readFile

main = do
  fileContents <- getFileContents
  let
    lineCount = countLines fileContents
  putStrLn $ unwords ["There", "are", "a", "total", "of", (show lineCount), "lines", "in", "the", "file!"]
