module Triangle(TriangleType(..), triangleType) where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
    | sum abc - maximum abc <= maximum abc = Illogical
    | all (== a) bc = Equilateral
    | b == c || c == a || a == b = Isosceles
    | otherwise = Scalene
    where abc@(_:bc) = [a, b, c]
