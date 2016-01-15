module Strain(keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep predicate (x:xs)
    | predicate x = x: keep predicate xs
    | otherwise   = keep predicate xs

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard predicate (x:xs)
    | predicate x = discard predicate xs
    | otherwise   = x: discard predicate xs
