module Binary(toDecimal) where

toDecimal :: String -> Int
toDecimal bin
    | not.all (`elem` "01") $ bin = 0
    | otherwise = foldr shift 0 (reverse bin)
    where
        shift x acc = if x == '1'
            then 2*acc + 1
            else 2*acc
