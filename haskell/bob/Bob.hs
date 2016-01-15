module Bob(responseFor) where

import Data.List(dropWhileEnd)
import Data.Char(isLower, isUpper, isSpace)

responseFor :: String -> String
responseFor = answer . rstrip
    where
        rstrip = dropWhileEnd isSpace
        answer question
            | question == "" = "Fine. Be that way!"
            | yell question = "Whoa, chill out!"
            | last question == '?' = "Sure."
            | otherwise = "Whatever."
        yell question = any isUpper question && not (any isLower question)
