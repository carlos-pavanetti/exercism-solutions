module Raindrops(convert) where

convert :: Int -> String
convert number = sandbox $ pling ++ plang ++ plong
    where
        pling = if number `isDivisibleBy` 3 then "Pling" else ""
        plang = if number `isDivisibleBy` 5 then "Plang" else ""
        plong = if number `isDivisibleBy` 7 then "Plong" else ""
        sandbox x = if x /= "" then x else show number
        n `isDivisibleBy` q = n `mod` q == 0
