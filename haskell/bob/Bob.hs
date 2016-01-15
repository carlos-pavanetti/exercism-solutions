module Bob(responseFor) where

import Data.Text(stripEnd, pack, unpack)
import Data.Char(isLower, isUpper)

responseFor :: String -> String
responseFor question = respond (unpack (stripEnd (pack question)))
    where
        respond question
            | question == "" = "Fine. Be that way!"
            | any isUpper question && not (any isLower question) = "Whoa, chill out!"
            | last question == '?' = "Sure."
            | otherwise = "Whatever."
