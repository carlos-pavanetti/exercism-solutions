module Sublist(Sublist(..), sublist) where

import Data.List(tails)

data Sublist = Equal | Sublist | Superlist | Unequal deriving(Eq, Show)

sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist [] [] = Equal
sublist [] _  = Sublist
sublist xs ys
    | lxs  > lys = invert (sublist ys xs)
    | lxs == lys && prefix xs ys = Equal
    | any (prefix xs) (tails ys) = Sublist
    | otherwise = Unequal
    where
        lxs = length xs
        lys = length ys
        invert s
            | s == Sublist = Superlist
            | s == Superlist = Sublist
            | otherwise = s
        prefix [] _ = True
        prefix _ [] = False
        prefix (x:xss) (y:yss) = x == y && prefix xss yss
