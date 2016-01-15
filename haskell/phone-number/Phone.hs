module Phone(areaCode, number, prettyPrint) where

import Data.Char(isDigit)
import Text.Printf(printf)

number :: String -> String
number unsafeNumber
    | length safeNumber < 10 = "0000000000"
    | length safeNumber == 11 =
        if head safeNumber == '1' then
            tail safeNumber
        else "0000000000"
    | length safeNumber > 11 = "0000000000"
    | otherwise = safeNumber
    where safeNumber = clearNumber unsafeNumber

areaCode :: String -> String
areaCode = take 3 . number

prettyPrint :: String -> String
prettyPrint xs = printf "(%s) %s-%s" code begin end
    where
        code    = areaCode (number xs)
        splited = splitAt 3 (drop 3 (number xs))
        begin   = fst splited
        end     = snd splited

clearNumber :: String -> String
clearNumber = filter isDigit
