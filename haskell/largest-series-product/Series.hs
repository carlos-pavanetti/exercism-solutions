{-# LANGUAGE UnicodeSyntax #-}

module Series (digits, slices, largestProduct) where

import Data.Char(digitToInt)

digits ∷ String → [Int]
digits = map digitToInt

slices ∷ Int → String → [[Int]]
slices _ [] = []
slices n xss@(_:xs)
    | n > length xss = []
    | otherwise = digits (take n xss) : slices n xs

largestProduct ∷ Int → String → Int
largestProduct n xs
    | xs == "" = 1
    | n > length xs = 1
    | otherwise = maximum . map product . slices n $ xs
