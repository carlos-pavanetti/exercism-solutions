module Beer(verse, sing) where

import Data.Char(toUpper)
import Text.Printf(printf)

verse :: Int -> String
verse n = printf (firstPart ++ lastPart n) (capitalize (bottle n)) (bottle n) (bottle nextNum)
    where
        nextNum = (n-1) `mod` 100
        firstPart = "%s of beer on the wall, %s of beer.\n"
        lastPart 0 = "Go to the store and buy some more, %s of beer on the wall.\n"
        lastPart 1 = "Take it down and pass it around, %s of beer on the wall.\n"
        lastPart _ = "Take one down and pass it around, %s of beer on the wall.\n"

bottle :: Int -> String
bottle 0 = "no more bottles"
bottle 1 = "1 bottle"
bottle x = show x ++ " bottles"

sing :: Int -> Int -> String
sing i j = foldr (\x acc -> concat [verse x, "\n", acc]) [] (reverse [j..i])

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x:xs
