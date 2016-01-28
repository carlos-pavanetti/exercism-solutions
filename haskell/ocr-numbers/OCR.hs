module OCR (convert) where

import Data.List (transpose, intercalate)
import Data.List.Split (chunksOf)

convertEachGroup :: String -> String
convertEachGroup = concatMap (map (convertDigit . unlines)) . chunksOf 4 . transpose . map (chunksOf 3) . lines

convert :: String -> String
convert = intercalate "," . map (convertEachGroup . unlines) . chunksOf 4 . lines


convertDigit :: String -> Char
convertDigit input = case process input of
    152526 -> '0'
    119556 -> '1'
    34509  -> '2'
    139485 -> '3'
    119961 -> '4'
    138189 -> '5'
    151311 -> '6'
    119559 -> '7'
    152769 -> '8'
    139647 -> '9'
    otherwise -> '?'

process :: String -> Int
process = foldr valueFunc 0
    where
        valueFunc '_' acc = 3*acc + 1
        valueFunc '|' acc = 3*acc + 2
        valueFunc  _  acc = 3*acc
