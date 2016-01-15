module Grains(square, total) where

square :: (Num c) => Int -> c
square = (!!) (iterate (*2) 1) . (+ (-1))

total :: Integer
total = (\n -> (2^n) - 1) 64
