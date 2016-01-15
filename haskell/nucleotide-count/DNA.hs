module DNA(count, nucleotideCounts) where

import qualified Data.Map as Map
import Text.Printf(printf)

count :: Char -> String -> Int
count nucleotide strand
    | invalidNucleotide nucleotide = invalidNucleotideError nucleotide
    | any invalidNucleotide strand  = invalidNucleotideError (getInvalidNucleotide strand)
    | otherwise = length . filter (== nucleotide) $ strand
    where
        validNucleotide x = x `elem` "ATCG"
        invalidNucleotide = not . validNucleotide
        getInvalidNucleotide = head . filter invalidNucleotide
        invalidNucleotideError = error . printf "invalid nucleotide '%c'"

nucleotideCounts :: String -> Map.Map Char Int
-- nucleotideCounts = fromList . map (\gss@(g:_) -> (g, length gss)) . group . sort
nucleotideCounts strand = Map.fromList (map (\x -> (x, count x strand)) "ATCG")
