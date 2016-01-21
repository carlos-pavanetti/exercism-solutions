module Atbash(encode) where

import Data.Char

encode :: String -> String
encode = space5 . map (cipher . toLower) . filter isAlphaNum
    where
        cipher x
            | isAlpha x = chr (against - ord x)
            | otherwise = x
        against = ord 'a' + ord 'z'

space5 :: String -> String
space5 str
    | length str <= 5 = str
    | otherwise = now ++ " " ++ space5 next
    where
        (now, next) = splitAt 5 str
