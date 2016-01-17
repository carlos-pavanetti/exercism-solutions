module ETL(transform) where

import Data.Char(toLower)
import qualified Data.Map as M
import Control.Arrow(first)

type Value = Int
type Letter = String

type OldScoreSet = M.Map Value [Letter]
type NewScoreSet = M.Map Letter Value

transform :: OldScoreSet -> NewScoreSet
transform = M.fromList . concatMap (lowerKey . transformEach) . M.toList
    where
    transformEach (s, ls) = zip ls (repeat s)
    lowerKey = map (first (map toLower))
