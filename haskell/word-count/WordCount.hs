module WordCount(wordCount) where

import Data.Char
import Data.List(sort, group)
import Data.Map(Map, fromList)

wordCount :: String -> Map String Int
wordCount = fromList . map (\xs@(x:_) -> (x, length xs)) . group . sort . toWords . map toLower

toWords :: String -> [String]
toWords s = case dropWhile blacklist s of
    "" -> []
    s' -> w : toWords s''
        where (w, s'') = break blacklist s'
    where
        blacklist c = isSymbol c || isPunctuation c || isSpace c
