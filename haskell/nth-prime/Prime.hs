module Prime (nth) where

nth :: Int -> Integer
nth = (!!) primes . pred

primes :: [Integer]
primes = 2: 3: 5: filter isPrime primeCandidates
    where
        isPrime x = and [x `mod` d /= 0 | d <- primesLessThanSquareRoot x]
        primesLessThanSquareRoot x = takeWhile (\p -> p*p <= x) primes
        primeCandidates = 7:11:13:17:19:23:29:31: map (+30) primeCandidates
