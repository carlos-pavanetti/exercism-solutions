module Meetup(Weekday(..), Schedule(..), meetupDay) where

import Data.Tuple.Extra(thd3)
import qualified Data.Time.Calendar as Calendar
import Data.Time.Calendar.WeekDate(toWeekDate)

type Year = Integer
type Month = Int
type Day = Int

data Weekday = Monday | Tuesday | Wednesday | Thursday |
               Friday | Saturday | Sunday deriving (Eq, Show, Read, Enum)

--------------------------------------------------------------------------------
-- Convert Weekday to Integral, according ISO 8601
-- param: Weekday
-- return: ISO Weekday: Int
-- Monday=> 1, Sunday=> 7
--------------------------------------------------------------------------------
weekdayToIso :: Weekday -> Day
weekdayToIso = succ . fromEnum
--------------------------------------------------------------------------------
-- Convert Weekday to Integral, according ISO 8601
-- param: ISO Weekday: Int
-- return: Weekday
-- 1=> Monday, 7=> Sunday
--------------------------------------------------------------------------------
isoToWeekday :: Day -> Weekday
isoToWeekday = toEnum . pred

data Schedule = First | Second | Third | Fourth | Teenth | Last
    deriving (Eq, Show, Read)

--------------------------------------------------------------------------------
-- Calculate date of meetup
-- params: Schedule[When meetup happens], Weekday, {Year Month} date
-- return: exactly meetup day, on Gregorian Date
--------------------------------------------------------------------------------
meetupDay :: Schedule -> Weekday -> Year -> Month -> Calendar.Day
meetupDay sch wd yy mm
    | when First  = toGregrorianDay fstWd
    | when Second = toGregrorianDay ( 7 + fstWd)
    | when Third  = toGregrorianDay (14 + fstWd)
    | when Fourth = toGregrorianDay (21 + fstWd)
    | when Teenth = toGregrorianDay (13 + succ fstWd `rem` 7)
    | otherwise   = toGregrorianDay (lastWeekday wd yy mm)
    where
        when = (== sch)
        toGregrorianDay = Calendar.fromGregorian yy mm
        fstWd = firstWeekday wd yy mm


--------------------------------------------------------------------------------
-- Return ISO Weekday number of 1st day of a month
-- params: year, month
-- return: iso weekday number [1-7]
--------------------------------------------------------------------------------
weekdayFirstDay :: Year -> Month -> Day
weekdayFirstDay yy mm = thd3 (toWeekDate (Calendar.fromGregorian yy mm 01))

--------------------------------------------------------------------------------
-- First weekday of a month
-- params: weekday, year, month
-- return: date of first weekday: iso weekday number [1-7]
--------------------------------------------------------------------------------
firstWeekday :: Weekday -> Year -> Month -> Day
firstWeekday wd yy mm = ((weekdayToIso wd - weekdayFirstDay yy mm) `mod` 7) + 1

--------------------------------------------------------------------------------
-- Last weekday of a month
-- Calculate from the first weekday of a month, looking for a day in month range
-- params: weekday, year, month
-- return: date of first weekday: iso weekday number [1-7]
--------------------------------------------------------------------------------
lastWeekday :: Weekday -> Year -> Month -> Day
lastWeekday wd yy mm =
    if fstWd + 28 > lastMonthDay then
        fstWd + 21
    else fstWd + 28
    where
        fstWd = firstWeekday wd yy mm
        lastMonthDay = Calendar.gregorianMonthLength yy mm
