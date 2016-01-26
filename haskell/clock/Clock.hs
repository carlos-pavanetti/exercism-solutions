module Clock where

import Text.Printf(printf)

data Clock = Clock Int Int deriving (Eq, Show)

instance Num Clock where
    (Clock h1 m1) + (Clock h2 m2) = fromHourMin (h1 + h2) (m1 + m2)
    (Clock h1 m1) - (Clock h2 m2) = fromHourMin (h1 - h2) (m1 - m2)
    fromInteger = fromHourMin 0 . fromInteger

    abs = undefined
    (*) = undefined
    signum = undefined

fromHourMin :: Int -> Int -> Clock
fromHourMin hours minutes = Clock ((hours + minutes `div` 60) `mod` 24) (minutes `mod` 60)

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m
