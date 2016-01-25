module Series (digits, slices, largestProduct) where

import Data.Char(digitToInt)

digits :: String -> [Int]
digits = map digitToInt

slices :: Int -> String -> [[Int]]
slices _ [] = []
slices n xss@(_:xs) =
    takeWhile ((== n) . length) (digits (take n xss) : slices n xs)

largestProduct :: Int -> String -> Int
largestProduct n xs
    | null slices_xs = 1
    | otherwise = maximum (map product slices_xs)
    where slices_xs = slices n xs
