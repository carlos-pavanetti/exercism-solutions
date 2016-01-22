module Garden where

import Data.List
import Data.List.Split(chunksOf)

data Plant = Radishes | Violets | Clover | Grass deriving (Eq, Show)
type Child = String
type Garden = [(Child, [Plant])]

letterToPlant :: Char -> Plant
letterToPlant letter = case letter of
    'R' -> Radishes
    'V' -> Violets
    'C' -> Clover
    'G' -> Grass
    otherwise -> error "Porra, vey"

garden :: [Child] -> String -> Garden
garden children cells = zip (sort children) (splitCells cells)
    where
        splitCells = map concat . transpose . map
            (chunksOf 2 . map letterToPlant) . lines

defaultGarden :: String -> Garden
defaultGarden = garden ["Alice", "Bob", "Charlie", "David", "Eve", "Fred",
                "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

lookupPlants :: Child -> Garden -> [Plant]
lookupPlants child = snd . head . filter ((==child) . fst)
