module Binary(toDecimal) where

import Data.Bits(shiftL)

toDecimal :: String -> Int
toDecimal bin
    | not.all (`elem` "01") $ bin = 0
    | otherwise = foldr shift 0 (reverse bin)
    where
        shift x acc = if x == '1'
            then acc `shiftL` 1 + 1
            else acc `shiftL` 1
