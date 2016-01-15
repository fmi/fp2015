-- програмата чете име на файл като вход
-- прочита файла и изкарва неговото съдържание на екрана
-- симулира често-срещаната команда cat

main = do
  fileName <- getLine
  fileContents <- readFile fileName
  putStrLn fileContents
