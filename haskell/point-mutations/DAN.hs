module DNA(hammingDistance) where

hammingDistance :: (Eq a) => [a] -> [a] -> Int
hammingDistance a = length . filter (uncurry (/=)) . zip a
