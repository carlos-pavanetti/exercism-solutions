module Strain(keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep predicate items = [x | x <- items, predicate x]

discard :: (a -> Bool) -> [a] -> [a]
discard predicate items = [x | x <- items, not (predicate x)]
