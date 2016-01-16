module WordCount(wordCount) where

import Data.Char
import Data.List.Split(splitWhen)
import qualified Data.Map as Map

wordCount :: String -> Map.Map String Int
wordCount = foldr (Map.alter increment) Map.empty . toWords . map toLower
    where
        increment Nothing  = Just 1
        increment (Just x) = Just (x + 1)

toWords :: String -> [String]
toWords = filter (not . null) . splitWhen blacklist
    where blacklist c = isSymbol c || isPunctuation c || isSpace c
