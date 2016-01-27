module Words where

words' :: Bool -> String -> [String]
words' _ []  = []
words' False xxs@(x:xs)
    | x == ' '  = words' False xs
    | otherwise = ys : words' False rest
     where (ys, rest) = break (== ' ') xxs

words' True xxs@(x:xs)
    | x == '\"'  = words' False xs
    | otherwise = ys : words' True rest
    where (ys, rest) = break (== '\"') xxs
