import System.Random
import Control.Monad

checkAnswer :: (Int, String, Int) -> Int -> Bool
checkAnswer (a, "+", b) given = a + b == given
checkAnswer (a, "-", b) given = a - b == given
checkAnswer (a, "*", b) given = a * b == given
checkAnswer (a, "%", b) given = a `div` b == given
checkAnswer (_, _, _) _ = False

randomRange :: Int -> Int -> IO Int
randomRange a b = getStdRandom (randomR (a,b))

randomEquation :: IO (Int, String, Int)
randomEquation = do
  number1 <- randomRange 1 100
  number2 <- randomRange 1 100
  operatorIndex <- randomRange 0 3
  let operator = ["+", "-", "*", "%"] !! operatorIndex
  return (number1, operator, number2)

tauntUser :: (Int, String, Int) -> IO ()
tauntUser (a, oper, b)  = putStrLn $ "CAN YOU ANSWER THIS?\n" ++ ((show a) ++ " " ++ oper ++ " " ++ (show b)) ++ " = ?"

main = forever $ do
  expression@(a, oper, b)  <- randomEquation
  tauntUser expression
  userGuess <- getLine
  let parsedGuess = read userGuess :: (Int)
  let result = checkAnswer expression parsedGuess
  if result then putStrLn "You guessed right!" else putStrLn "You guessed wrong :("
