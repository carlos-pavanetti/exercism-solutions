module PigLatin (translate) where

import Data.Char
import Data.List.Split

processWord :: String -> String
processWord (f:s:t:rest)
    | f `elem` "aeiou" = f:s:t:rest ++ "ay"
    | [f, s, t] `elem` ["thr", "sch"] = rest ++ f:s:t:"ay"
    | [s, t] == "qu" = rest ++ f:s:t:"ay"
    | [f, s] `elem` ["qu", "ch", "th"] = t:rest ++ f:s:"ay"
    | otherwise = s:t:rest ++ f:"ay"
processWord _ = undefined

translate :: String -> String
translate = concatMap processPart . splitWords
    where
        processPart part =
            if all isAlpha part
                then processWord part
                else part
        splitWords = split (whenElt (not.isAlpha))
