module Atbash(encode) where

import Data.Char
import Data.List.Split(chunksOf)

encode :: String -> String
encode = unwords . chunksOf 5 . map (cipher . toLower) . filter isAsciiAlphaNum
    where
        cipher x
            | isAlpha x = chr (against - ord x)
            | otherwise = x
        against = ord 'a' + ord 'z'
        isAsciiAlphaNum x = isAscii x && isAlphaNum x
