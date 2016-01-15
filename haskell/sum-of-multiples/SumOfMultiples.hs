module SumOfMultiples(sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples xs limit = sum [x | x <- [1..limit-1], 0 `elem` [x `mod` b | b <- xs]]

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]
