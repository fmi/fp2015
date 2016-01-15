maxFunction :: Ord a => [(a -> a)] -> a -> a
maxFunction fs x =  maximum $ map (\f -> f x) fs
