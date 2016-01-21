module CryptoSquare (
    normalizePlaintext,
    normalizeCiphertext,
    squareSize, ciphertext,
    plaintextSegments
) where

import Data.Char
import Data.List(transpose)
import Data.List.Split(chunksOf)

normalizePlaintext :: String -> String
normalizePlaintext = map toLower . filter isAlphaNum

squareSize :: String -> Int
squareSize text = head $ dropWhile (\x -> x*x < length text) [1..]

plaintextSegments :: String -> [String]
plaintextSegments text = chunksOf (squareSize normalized) normalized
    where normalized = normalizePlaintext text

ciphertext :: String -> String
ciphertext = concat . transpose . plaintextSegments

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . transpose . plaintextSegments
