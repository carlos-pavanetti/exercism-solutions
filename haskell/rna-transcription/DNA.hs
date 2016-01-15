module DNA(toRNA) where

transcriteRNA :: Char -> Char
transcriteRNA x
    | x == 'G' = 'C'
    | x == 'C' = 'G'
    | x == 'T' = 'A'
    | x == 'A' = 'U'
    | otherwise = x

toRNA :: String -> String
toRNA = map transcriteRNA
