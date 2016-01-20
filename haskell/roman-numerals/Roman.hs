module Roman(numerals) where

numerals :: Int -> String
numerals n = concat . reverse . map romanizeDigitEach $ digits
    where
        digits = zip (iterate (`div` 10) n) [1..4]
        romanizeDigitEach (digit, order) = romanizeDigit (digit `mod` 10) order

romanizeDigit :: Int -> Int -> String
romanizeDigit 0 _ = ""
romanizeDigit 1 1 = "I"
romanizeDigit 1 2 = "X"
romanizeDigit 1 3 = "C"
romanizeDigit 1 4 = "M"

romanizeDigit 5 1 = "V"
romanizeDigit 5 2 = "L"
romanizeDigit 5 3 = "D"

romanizeDigit 4 order = romanizeDigit 1 order ++ romanizeDigit 5 order
romanizeDigit 9 order = romanizeDigit 1 order ++ romanizeDigit 1 (succ order)
romanizeDigit n order = romanizeDigit (n-1) order ++ romanizeDigit 1 order
