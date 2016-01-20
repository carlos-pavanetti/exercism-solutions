module Allergies(Allergen(..), isAllergicTo, allergies) where

import Data.Bits((.&.))

data Allergen = Eggs | Peanuts | Shellfish | Strawberries |
                Tomatoes | Chocolate | Pollen | Cats deriving (Eq, Enum, Show)

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergy score = score .&. allergyScore allergy /= 0

allergies :: Int -> [Allergen]
allergies scores = filter (`isAllergicTo` scores) [Eggs .. Cats]

allergyScore :: Allergen -> Int
allergyScore = (2^) . fromEnum
