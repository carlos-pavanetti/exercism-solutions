module Prime (nth) where

nth :: Int -> Integer
nth = (!!) primes . pred

primes :: [Integer]
primes = 2: 3: filter isPrime primeCandidates
    where
        isPrime x = and [x `mod` d /= 0 | d <- primesLessThanSquareRoot x]
        primesLessThanSquareRoot x = takeWhile (\p -> p*p <= x) primes
        primeCandidates = 5: 7: map (+6) primeCandidates
