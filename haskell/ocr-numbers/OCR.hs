module OCR (convert) where

import Data.List (transpose, intercalate)
import Data.List.Split (chunksOf)

type OpticalTextLine = [String]  -- 4 string lines formes a text line

convert :: String -> String
convert = groupLines . convertByLine . splitTextLines
    where
        splitTextLines :: String -> [OpticalTextLine]
        splitTextLines = chunksOf 4 . lines

        convertByLine :: [OpticalTextLine] -> [String]
        convertByLine = map convertEachLine

        groupLines :: [String] -> String
        groupLines = intercalate ","

convertEachLine :: OpticalTextLine -> String
convertEachLine = map (convertDigit . unlines) . groupDigits
    where
        groupDigits =  transpose . map (chunksOf 3)

convertDigit :: String -> Char
convertDigit input = case lexicon input of
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

lexicon :: String -> Int
lexicon = foldr processPattern 0
    where
        processPattern '_' acc = 3*acc + 1
        processPattern '|' acc = 3*acc + 2
        processPattern  _  acc = 3*acc
