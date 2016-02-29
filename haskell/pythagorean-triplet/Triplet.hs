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
pythagoreanTriplets lowerBound upperBound =
    filter isPythagorean [Triplet a b c
                         | a<-[lowerBound .. upperBound]
                         , b<-[a          .. upperBound]
                         , c<-[b          .. upperBound]
                         ]
