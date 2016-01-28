module Minesweeper (annotate) where

import Data.Char (intToDigit)

annotate :: [[Char]] -> [[Char]]
annotate board = [[counts y x | x <- [0 .. width]] | y <- [0 .. height]]
    where
        height = length board - 1
        width = length (head board) - 1
        square y x = (board !! y) !! x
        counts y x
            | '*' == square y x = '*'
            | otherwise =
                let mines = minesAround y x in
                if null mines
                    then ' '
                    else intToDigit (length mines)
        minesAround y x =
            let
                xLowerLim = max 0 (x - 1)
                yLowerLim = max 0 (y - 1)
                xUpperLim = min width  (x + 1)
                yUpperLim = min height (y + 1)
            in
            [(a, b) | a <- [xLowerLim .. xUpperLim],
                      b <- [yLowerLim .. yUpperLim],
                      '*' == square b a]
