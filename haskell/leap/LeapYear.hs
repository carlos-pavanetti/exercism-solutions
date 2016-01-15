module LeapYear(isLeapYear) where

import qualified Data.Time.Calendar as Calendar
isLeapYear :: Integer -> Bool
isLeapYear = Calendar.isLeapYear
