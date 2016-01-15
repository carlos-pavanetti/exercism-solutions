module DNA(count, nucleotideCounts) where

import qualified Data.Map as Map
import Text.Printf(printf)

count :: Char -> String -> Int
count nucleotide strand
    | invalidNucleotide nucleotide = invalidNucleotideError nucleotide
    | invalidStrand strand = invalidStrandError strand
    | otherwise = length . filter (== nucleotide) $ strand

nucleotideCounts :: String -> Map.Map Char Int
nucleotideCounts strand
    | invalidStrand strand = invalidStrandError strand
    | otherwise = Map.fromList (map (\x -> (x, count x strand)) "ATCG")

--------------------------------------------------------------------------------
-- Validate helpers
validNucleotide :: Char -> Bool
validNucleotide = (`elem` "ATCG")

invalidNucleotide :: Char -> Bool
invalidNucleotide = not . validNucleotide

invalidStrand :: String -> Bool
invalidStrand = any invalidNucleotide

--------------------------------------------------------------------------------
-- Error helpers
invalidNucleotideError :: Char -> a
invalidNucleotideError = error . printf "invalid nucleotide '%c'"

invalidStrandError :: String -> a
invalidStrandError = invalidNucleotideError . head . filter invalidNucleotide
