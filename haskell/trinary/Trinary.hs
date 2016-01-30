module Trinary (showTri, readTri) where


type Trinary = String
type Decimal a = a

showTri :: (Integral a, Show a) => Decimal a -> Trinary
showTri = buildTrinaryString ""
    where
        buildTrinaryString acc 0 = acc
        buildTrinaryString acc x =
            let
                (rest, digit) = x `divMod` 3
            in buildTrinaryString acc rest ++ show digit

readTri :: (Integral a) => Trinary -> Decimal a
readTri = foldl accumTrinary 0
    where
        accumTrinary acc dig =
            if digitValue == garbageDigitValue
                then 0
                else 3 * acc + digitValue
            where digitValue = fromTriDigit dig
        fromTriDigit dig =
            if null values
                then garbageDigitValue
                else fst . head $ values
            where values = filter ((== dig). snd) (zip [0 .. 2] ['0' .. '2'])
        garbageDigitValue = -100
