module WordCount(wordCount) where

import Data.Char
import Data.List(sort, group)
import Data.Map(Map, fromList)

wordCount :: String -> Map String Int
wordCount = fromList . map (\xs@(x:_) -> (x, length xs)) . group . sort . words . filter (not . blacklist) . map toLower
    where blacklist s = isSymbol s || isPunctuation s
