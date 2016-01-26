module ETL(transform) where

import Data.Char(toLower)
import Data.List(foldl')
import qualified Data.Map.Strict as M

type Value = Int
type Letter = String

type OldScoreSet = M.Map Value [Letter]
type NewScoreSet = M.Map Letter Value

transform :: OldScoreSet -> NewScoreSet
transform = M.foldrWithKey transformEach M.empty

transformEach :: Value -> [Letter] -> NewScoreSet -> NewScoreSet
transformEach score = flip (foldl' newRecord)
    where
    newRecord :: NewScoreSet -> Letter -> NewScoreSet
    newRecord = flip ((`M.insert` score) . map toLower)
