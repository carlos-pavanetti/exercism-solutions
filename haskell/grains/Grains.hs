module Grains(square, total) where

square :: (Integral b, Num c) => b -> c
square = (2^) . (+ (-1))

total :: Integer
total = (\n -> (2^n) - 1) 64
