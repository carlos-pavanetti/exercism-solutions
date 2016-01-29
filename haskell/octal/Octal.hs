module Octal (showOct, readOct) where


type Octal = String
type Decimal a = a

showOct :: (Integral a, Show a) => Decimal a -> Octal
showOct = buildOctString ""
    where
        buildOctString acc 0 = acc
        buildOctString acc x =
            let currentDig = show (x `mod` 8)
                stringRest = buildOctString acc (x `div` 8)
            in stringRest ++ currentDig

readOct :: (Integral a) => Octal -> Decimal a
readOct = foldl accumOct 0
    where
        accumOct acc dig = 8 * acc + fromOctDigit dig
        fromOctDigit dig =
            let [value] = filter ((== dig). snd) (zip [0 .. 7] ['0'..'7'])
            in fst value
