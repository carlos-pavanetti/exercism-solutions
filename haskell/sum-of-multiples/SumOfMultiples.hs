module SumOfMultiples(sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples xs limit = sum [x | x <- [1..limit-1], any ((==0). (x `mod`)) xs]

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]
