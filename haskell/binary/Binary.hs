module Binary(toDecimal) where

import Data.Bits(shiftL)
import Data.Char(digitToInt)

toDecimal :: String -> Int
toDecimal bin
    | any (`notElem` "01") bin = 0
    | otherwise = foldl shift 0 bin
    where shift acc x = acc `shiftL` 1 + digitToInt x
