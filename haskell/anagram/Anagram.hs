module Anagram(anagramsFor, isAnagram) where

import Data.Char(toLower)
import Data.List(sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter (isAnagram word)

isAnagram :: String -> String -> Bool
isAnagram a b
    | lowerA == lowerB = False
    | otherwise = sort lowerA == sort lowerB
    where
        lowerA = map toLower a
        lowerB = map toLower b
