module ETL(transform) where

import Data.Char(toLower)
import qualified Data.Map as M

type Value = Int
type Letter = String

type OldScoreSet = M.Map Value [Letter]
type NewScoreSet = M.Map Letter Value

transform :: OldScoreSet -> NewScoreSet
transform = M.foldrWithKey transformEach M.empty

transformEach :: Value -> [Letter] -> NewScoreSet -> NewScoreSet
transformEach score = flip (foldr newRecord)
    where
    newRecord :: Letter -> NewScoreSet -> NewScoreSet
    newRecord = (`M.insert` score) . map toLower
