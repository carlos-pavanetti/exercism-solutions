module Luhn (checkDigit, addends, checksum, isValid, create) where
-- module Luhn where

import Data.List(unfoldr)

addends :: Integer -> [Integer]
addends number = reverse . map fst $ unfoldr doAddends (number, False)
    where
        doAddends (n, double)
            | n == 0 = Nothing
            | not double = justPair $ n `mod` 10
            | n `mod` 10 >= 5 = justPair $ 1 + (2*n) `mod` 10
            | otherwise = justPair $ (2*n) `mod` 10
            where
                double'' = not double
                next = (n `div` 10, double'')
                justPair x = Just ((x, double), next)


create :: Integer -> Integer
create input = deslocInput + ((9 * addendsSum) `mod` 10)
    where
        deslocInput = 10 * input
        addendsSum = checksum deslocInput

checkDigit :: Integer -> Integer
checkDigit = (`mod` 10)

checksum :: Integer -> Integer
checksum = checkDigit . sum . addends

isValid :: Integer -> Bool
isValid = (0 ==) . checksum
