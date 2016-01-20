module Triangle(TriangleType(..), triangleType) where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
    | not (isTriangle a b c) = Illogical
    | all (== a) [b, c] = Equilateral
    | b == c || c == a || a == b = Isosceles
    | otherwise = Scalene

isTriangle :: Int -> Int -> Int -> Bool
isTriangle a b c = sum [a, b, c] > 2 * maximum [a, b, c]
