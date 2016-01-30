module Grains(square, total) where

square :: (Integral a) => a -> a
square = (2^) . pred

totalUntil :: Integral a => a -> a
totalUntil = pred . (2^)

total :: Integral a => a
total = totalUntil 64
