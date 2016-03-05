module Matrix (saddlePoints) where

import Data.Array

saddlePoints :: Ord e => Array (Int, Int) e -> [(Int, Int)]
saddlePoints matrix = filter isSaddlePoint $ indices matrix
    where
        isSaddlePoint ix = isGEinLine ix && isLEinColumn ix
        isGEinLine (i, j) =
            let elm = matrix ! (i, j)
            in and [matrix ! (i, y) <= elm | y <-jBounds]
        isLEinColumn (i, j) =
            let elm = matrix ! (i, j)
            in and [matrix ! (x, j) >= elm | x <-iBounds]
        (iBounds, jBounds) =
            let ((xi, yi), (xn, yn)) = bounds matrix
            in ([xi .. xn], [yi .. yn])
