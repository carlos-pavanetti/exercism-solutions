module Triangle (row, triangle) where

row :: Integral a => a -> [a]
row 1 = [1]
row n = zipWith (+) (0: previousRow) (previousRow ++ [0])
    where previousRow = row $ n - 1

triangle :: Integral a => [[a]]
triangle = map row [1..]
