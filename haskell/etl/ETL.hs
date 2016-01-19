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
transformEach score letters nss = foldr foldDownCase nss letters
    where
    foldDownCase :: Letter -> NewScoreSet -> NewScoreSet
    foldDownCase = (`M.insert` score) . map toLower
