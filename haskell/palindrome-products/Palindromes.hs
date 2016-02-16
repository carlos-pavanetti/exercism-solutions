module Palindromes where

isPalindrome :: Integral a => a -> Bool
isPalindrome number = reversed number == number

reversed :: Integral a => a -> a
reversed number = foldl (\acc x -> 10 * acc + x) 0 (digits number)
    where
        digits 0 = []
        digits n =
            let (q, r) = n `quotRem` 10 in
            r: digits q

isPalindromeProduct :: Integral a => (a, a) -> Bool
isPalindromeProduct = isPalindrome . uncurry (*)

palindromes :: Integral a => a -> a -> [(a, (a, a))]
palindromes lower upper = [set a b | a<-range, b<-range, isPalindrome (a * b)]
    where
        range = [lower..upper]
        set a b = (a * b, (a, b))

largestPalindrome :: Integral a => a -> a -> (a, [(a, a)])
largestPalindrome lower upper = (largest, factors)
    where
        largest = maximum pairProducts
        factors = [snd pair | pair<-palindromesSet, largest == fst pair]
        pairProducts = map fst palindromesSet
        palindromesSet = palindromes lower upper

smallestPalindrome :: Integral a => a -> a -> (a, [(a, a)])
smallestPalindrome lower upper = (smallest, factors)
    where
        smallest = minimum pairProducts
        factors = [snd pair | pair<-palindromesSet, smallest == fst pair]
        pairProducts = map fst palindromesSet
        palindromesSet = palindromes lower upper
