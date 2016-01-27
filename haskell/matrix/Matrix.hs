{-# LANGUAGE FlexibleInstances #-}
module Matrix where

import qualified Data.List as L
import qualified Data.Vector as V

import Data.Char(isSpace, toUpper)
import Control.Arrow((&&&))

-- data Matrix a = Matrix (V.Vector (V.Vector a))
data Matrix a = Matrix [[a]] deriving (Eq, Show)

row :: Int -> Matrix a -> V.Vector a
row i (Matrix m) = V.fromList (m !! i)

column :: Int -> Matrix a -> V.Vector a
column j = row j . transpose

rows :: Matrix a -> Int
rows (Matrix m) = length m
cols :: Matrix a -> Int
cols (Matrix m) = length $ if null m then [] else head m

shape :: Matrix a -> (Int, Int)
shape = rows &&& cols

fromString :: Read a => String -> Matrix a
fromString = fromList . map (map read . words) . lines

fromList :: [[a]] -> Matrix a
fromList = Matrix

transpose :: Matrix a -> Matrix a
transpose (Matrix m) = Matrix (L.transpose m)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (i,j) (Matrix m) = fromList $ reshapeList flatten_m i
    where
        flatten_m = concat m
        reshapeList [] _ = []
        reshapeList  _ 0 = []
        reshapeList mt r = take j mt : reshapeList (drop j mt) (r-1)

flatten :: Matrix a -> V.Vector a
flatten (Matrix m) = V.fromList $ concat m
