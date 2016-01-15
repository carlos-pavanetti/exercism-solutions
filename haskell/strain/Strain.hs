module Strain(keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep predicate = foldr (\x acc -> if predicate x then x:acc else acc) []

discard :: (a -> Bool) -> [a] -> [a]
discard predicate = keep (not . predicate) -- We always can do it!
