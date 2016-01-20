module Triangle(TriangleType(..), triangleType) where

import Data.List(nub)

data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
    | not (isTriangle a b c) = Illogical
    | uniques == 0 = Equilateral
    | uniques == 1 = Isosceles
    | otherwise = Scalene
    where uniques = length (nub [a, b, c]) - 1

isTriangle :: Int -> Int -> Int -> Bool
isTriangle a b c = sum [a, b, c] > 2 * maximum [a, b, c]
