module Phone(areaCode, number, prettyPrint) where

import Data.Char(isDigit)

number :: String -> String
number unsafeNumber
    | length safeNumber < 10 = "0000000000"
    | length safeNumber == 11 =
        if head safeNumber == '1' then
            tail safeNumber
        else "0000000000"
    | length safeNumber > 11 = "0000000000"
    | otherwise = safeNumber
    where safeNumber = filter isDigit unsafeNumber

areaCode :: String -> String
areaCode = undefined
prettyPrint = undefined
