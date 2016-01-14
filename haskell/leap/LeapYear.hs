module LeapYear(isLeapYear) where
    isLeapYear :: Int -> Bool
    isLeapYear year
        | year `isDividedBy` 100 = year `isDividedBy` 400
        | otherwise = year `isDividedBy` 4
        where isDividedBy a b = a `mod` b == 0
