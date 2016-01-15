module DNA(hammingDistance) where

hammingDistance :: (Eq a) => [a] -> [a] -> Int
hammingDistance = (sum .) . zipWith ((fromEnum .) . (==))
