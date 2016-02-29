module Triplet (mkTriplet, isPythagorean, pythagoreanTriplets) where

data Triplet a = Triplet a a a deriving (Eq, Show)

mkTriplet :: a -> a -> a -> Triplet a
mkTriplet = Triplet

isPythagorean :: (Eq a, Num a, Ord a) => Triplet a -> Bool
isPythagorean (Triplet a b c) = (catA*catA + catB*catB) == hypt*hypt
    where
        hypt = maximum [a, b, c]
        catA = minimum [a, b, c]
        catB = a + b + c - hypt - catA

pythagoreanTriplets :: (Enum a, Eq a, Num a, Ord a) => a -> a -> [Triplet a]
pythagoreanTriplets lowerBound upperBound = [Triplet ((m*m)-(n*n)) (2*m*n) ((m*m)+(n*n)) | m<-range, n<-range, inBound m n]
    where
        range = takeWhile (\n -> 2*n*n < upperBound) [1..]
        inBound m n = m > n && (m*m-n*n) `elem` bound || (2*m*n) `elem` bound || (m*m+n*n) `elem` bound
        bound = [lowerBound .. upperBound]
