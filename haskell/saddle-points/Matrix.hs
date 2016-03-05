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
        jBounds =
            let ((_, yi), (_, yn)) = bounds matrix
            in [yi .. yn]
        iBounds =
            let ((xi, _), (xn, _)) = bounds matrix
            in [xi .. xn]
