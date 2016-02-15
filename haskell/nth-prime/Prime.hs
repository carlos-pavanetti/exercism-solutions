module Prime (nth) where

nth :: Int -> Integer
nth = (!!) primes . pred

primes :: [Integer]
primes = 2: 3: filter isPrime [5,7..]
    where
        isPrime x = and [x `mod` d /= 0 | d <- primesLessThanSquareRoot x]
        primesLessThanSquareRoot x = takeWhile (\p -> p*p <= x) primes
