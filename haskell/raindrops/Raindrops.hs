module Raindrops(convert) where

convert :: Int -> String
convert number = if null answer then show number else answer
    where
        pling = if number `isDivisibleBy` 3 then "Pling" else ""
        plang = if number `isDivisibleBy` 5 then "Plang" else ""
        plong = if number `isDivisibleBy` 7 then "Plong" else ""
        answer = pling ++ plang ++ plong
        n `isDivisibleBy` q = n `mod` q == 0
