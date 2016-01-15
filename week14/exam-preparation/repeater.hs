import Data.List

join = intercalate

repeater :: String -> (Int -> String -> String)
repeater what = helper
  where
    helper times glue = join glue $ replicate times what

