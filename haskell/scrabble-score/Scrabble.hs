module Scrabble(scoreLetter, scoreWord) where

import Data.Char(toUpper)

scoreLetter :: Char -> Int
scoreLetter n
    | upperN `elem` "AEIOULNRST" = 1
    | upperN `elem` "DG"         = 2
    | upperN `elem` "BCMP"       = 3
    | upperN `elem` "FHVWY"      = 4
    | upperN == 'K'              = 5
    | upperN `elem` "JX"         = 8
    | upperN `elem` "QZ"         = 10
    | otherwise             = 0
    where upperN = toUpper n

scoreWord :: String -> Int
scoreWord = sum .  map scoreLetter
