module PrimeFactors(primeFactors) where

primeFactors :: Int -> [Int]
primeFactors number
    | number `isDivisibleBy` 2 = 2: primeFactors (number `quot` 2)
    | number `isDivisibleBy` 3 = 3: primeFactors (number `quot` 3)
    | number == 1 = []
    | otherwise = factor: primeFactors (number `quot` factor)
    where
        n `isDivisibleBy` p = n `mod` p == 0
        factor = head [fac | n<-[1..number], fac <- nxtFac n, number `isDivisibleBy` fac]
        nxtFac n = [6 * n - 1, 6 * n + 1]
