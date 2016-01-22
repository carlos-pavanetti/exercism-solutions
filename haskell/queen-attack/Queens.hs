module Queens (boardString, canAttack) where

import Data.List(intersperse)
import Data.List.Split(chunksOf)

type BoardSquare = (Int, Int)
type Piece = Maybe BoardSquare

boardString :: Piece -> Piece -> String
boardString w b =
    unlines . map (intersperse ' ') . chunksOf 8 . map squareToChar $ board
    where
        board = [(x,y) | x<-[0..7],y<-[0..7]]

        squareToChar :: BoardSquare -> Char
        squareToChar sq
            | w `isOn` sq = 'W'
            | b `isOn` sq = 'B'
            | otherwise = '_'

        isOn :: Piece -> BoardSquare -> Bool
        pc `isOn` sq = Just sq == pc

canAttack :: BoardSquare -> BoardSquare -> Bool
w `canAttack` b = w `canAttackOnLine` b || w `canAttackOnColumn` b ||
                  w `canAttackOnDiagonal` b
    where
        canAttackOnLine (l, _) (l', _) = l == l'
        canAttackOnColumn (_, c) (_, c') = c == c'
        canAttackOnDiagonal (l, c) (l', c') =
            (l - c) == (l' - c') || (l + c) == (l' + c')
