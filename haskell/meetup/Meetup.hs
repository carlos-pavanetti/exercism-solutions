module Meetup(Weekday(..), Schedule(..), meetupDay) where

import Data.Tuple.Extra(thd3)
import qualified Data.Time.Calendar as Calendar
import Data.Time.Calendar.WeekDate(toWeekDate)

type Year = Integer
type Month = Int
type Day = Int
data Weekday = Monday | Tuesday | Wednesday | Thursday |
               Friday | Saturday | Sunday deriving (Eq, Show, Read, Enum)

weekdayToIso :: Weekday -> Day
weekdayToIso = succ . fromEnum
isoToWeekday :: Day -> Weekday
isoToWeekday = toEnum . pred

data Schedule = First | Second | Third | Fourth | Teenth | Last
    deriving (Eq, Show, Read)

meetupDay :: Schedule -> Weekday -> Year -> Month -> Calendar.Day
meetupDay sch wd yy mm
    | when First  = toGregrorianDay fstWd
    | when Second = toGregrorianDay ( 7 + fstWd)
    | when Third  = toGregrorianDay (14 + fstWd)
    | when Fourth = toGregrorianDay (21 + fstWd)
    | when Teenth =
        if fstWd <= weekdayToIso Friday then
            meetupDay Third wd yy mm
        else
            meetupDay Second wd yy mm
    | otherwise = toGregrorianDay (lastWeekday wd yy mm)
    where
        when = (== sch)
        toGregrorianDay = Calendar.fromGregorian yy mm
        fstWd = firstWeekday wd yy mm

weekdayFirstDay :: Year -> Month -> Day
weekdayFirstDay yy mm = thd3 (toWeekDate (Calendar.fromGregorian yy mm 01))

firstWeekday :: Weekday -> Year -> Month -> Day
firstWeekday wd yy mm = ((weekdayToIso wd - weekdayFirstDay yy mm) `mod` 7) + 1

lastWeekday :: Weekday -> Year -> Month -> Day
lastWeekday wd yy mm =
    if fstWd + 28 > lastMonthDay then
        fstWd + 21
    else fstWd + 28
    where
        fstWd = firstWeekday wd yy mm
        lastMonthDay = Calendar.gregorianMonthLength yy mm
