module DNA(toRNA) where

transcribeRNA :: Char -> Char
transcribeRNA x = case x of
    'G' -> 'C'
    'C' -> 'G'
    'T' -> 'A'
    'A' -> 'U'
    otherwise -> error ("invalid nucleotide " ++ [x])

toRNA :: String -> String
toRNA = map transcribeRNA
