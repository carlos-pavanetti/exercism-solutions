module WordCount(wordCount) where

import Data.Char
import Data.List(group, sort)
import Data.List.Split(wordsBy)
import qualified Data.Map as Map
import Control.Arrow((&&&))

wordCount :: String -> Map.Map String Int
wordCount = Map.fromList . map (head &&& length) . group . sort . toWords . map toLower

toWords :: String -> [String]
toWords = wordsBy blacklist
    where blacklist c = isSymbol c || isPunctuation c || isSpace c
