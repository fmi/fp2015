-- програмата се пуска така : runhaskell helloworld.hs
-- програмата чака за вход от потребителя (неговото име)
-- и изкарва съобщение като изход
main = do
  name <- getLine
  putStrLn $ unwords ["Hello", name, "!"] 

