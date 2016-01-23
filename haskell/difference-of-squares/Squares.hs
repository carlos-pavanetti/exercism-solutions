module Squares (sumOfSquares, squareOfSums, difference) where

import Control.Monad(liftM2)

_2int :: Int
_2int = 2

sumOfSquares :: Integral a => a -> a
sumOfSquares = sum . map (^_2int) . enumFromTo 1

squareOfSums :: Integral a => a -> a
squareOfSums = (^_2int) . sum . enumFromTo 1

difference :: Integral a => a -> a
difference = liftM2 (-) squareOfSums sumOfSquares
