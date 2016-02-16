module Palindromes (largestPalindrome, smallestPalindrome) where

-- diagonalize :: [a] -> [b] -> [(a, b)]
-- diagonalize = diagonalizeWith (\a b -> (a, b))

diagonalizeWith :: (a -> b -> c) -> [a] -> [b] -> [c]
diagonalizeWith f xs ys = concat $ diagonals 0
    where
        lastDiagonal = min (length xs) (length ys)
        diagonals k
            | k > lastDiagonal = []
            | otherwise =
                [
                    let
                        x = (xs !! m)
                        y = ys !! (k - m)
                    in
                    f x y | m <- [0.. k], k < m + lastDiagonal, m < lastDiagonal
                ]: diagonals (k + 1)

largestPalindrome :: Integral a => a -> a -> (a, [(a, a)])
largestPalindrome lower upper = (largest, factors)
    where
        factors = [(x, y)
                  | x <- range,
                    x `isDivisorOf` largest,
                    let y = largest `quot` x,
                    y >= lower,
                    y <= upper]
        largest = head . filter isPalindrome $ diagonalizeWith (*) range range
        range = reverse [lower.. upper]
        a `isDivisorOf` b = b `rem` a == 0

smallestPalindrome :: Integral a => a -> a -> (a, [(a, a)])
smallestPalindrome lower upper = (largest, factors)
    where
        factors = [(x, y)
                  | x <- range,
                    x `isDivisorOf` largest,
                    let y = largest `quot` x,
                    y >= lower,
                    y <= upper]
        largest = head . filter isPalindrome $ diagonalizeWith (*) range range
        range = [lower.. upper]
        a `isDivisorOf` b = b `rem` a == 0

isPalindrome :: Integral a => a -> Bool
isPalindrome number = reversed number == number

reversed :: Integral a => a -> a
reversed number = foldl (\acc x -> 10 * acc + x) 0 (digits number)
    where
        digits 0 = []
        digits n =
            let (q, r) = n `quotRem` 10 in
            r: digits q
