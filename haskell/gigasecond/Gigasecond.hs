module Gigasecond(fromDay) where

import Data.Time(UTCTime, addUTCTime)

fromDay :: UTCTime -> UTCTime
fromDay = addUTCTime 1e9
