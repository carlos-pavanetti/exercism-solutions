module PigLatin (translate) where

import Data.Char
import Data.List.Split

translate :: String -> String
translate = concatMap processPart . splitWords
    where
        processPart part =
            if all isAlpha part
                then reorder part ++ "ay"
                else part
        -- could be words, but I inspired it in the Lua pig latin problem,
        -- where it could have non alpha chars
        splitWords = split (whenElt (not.isAlpha))
        reorder [] = []
        reorder ('q':'u':css) = css ++ "qu"
        reorder (c:css)
            | c `elem` "aeiou" = c:css
            | otherwise = reorder (css ++ [c])
