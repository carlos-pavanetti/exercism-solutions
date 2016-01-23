module Hexadecimal (hexToInt) where

import Data.Char(ord, toLower)

hexToInt :: String -> Int
hexToInt hex
    | isHexDigit `all` hex = foldl (\acc x -> acc*16 + x) 0 . map (hexValue . toLower) $ hex
    | otherwise = 0

hexValue :: Char -> Int
hexValue ch
    | ch `elem` ['0'..'9'] = ord ch - ord '0'
    | ch `elem` ['a'..'f'] = ord ch - ord 'a' + 10
    | otherwise = 0

isHexDigit :: Char -> Bool
isHexDigit = (`elem` (['0'..'9'] ++ ['a'..'f']))
