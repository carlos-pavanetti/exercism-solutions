module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = seq (f acc x) foldl' f (f acc x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ acc [] = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

length :: [a] -> Int
length = foldl' (const.succ) 0

reverse :: [a] -> [a]
reverse = foldl (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map f = foldr ((:).f) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x -> if p x then (x:) else id) []

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
