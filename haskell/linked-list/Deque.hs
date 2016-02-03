module Deque where

import Data.IORef
import Data.Maybe
import Control.Monad

type Deque a = IORef (FingerTree a)

push :: Deque a -> a -> IO ()
push deque value = do
    fg <- readIORef deque
    let nfg = fg |> value
    writeIORef deque nfg

unshift :: Deque a -> a -> IO ()
unshift deque value = do
    fg <- readIORef deque
    let nfg = value <| fg
    writeIORef deque nfg

shift :: Deque a -> IO (Maybe a)
shift deque = do
    fg <- readIORef deque
    let fstPair = getFirst fg
    if isJust fstPair
        then return Nothing
        else return (Just (fst (fromJust fstPair)))
--------------------------------------------------------------------------------
data Digit a =
    One a
    | Two a a
    | Three a a a
    deriving Show

data Node a =
    Node2 a a
    -- | Node3 a a a
    deriving Show

data FingerTree a =
    Empty
    | Single a
    | Deep (Digit a) (FingerTree (Node a)) (Digit a)
    deriving Show

digitToList :: Digit a -> [a]
digitToList (One a) = [a]
digitToList (Two a b) = [a, b]
digitToList (Three a b c) = [a, b, c]

toList :: FingerTree a -> [a]
toList Empty = []
toList (Single a) = [a]
toList (Deep a ft b) = digitToList a ++ deepList (toList ft) ++ digitToList b
    where
        deepList [] = []
        deepList (Node2 x y:xs) = [x, y] ++ deepList xs

fromList :: [a] -> FingerTree a
fromList = foldr (<|) Empty

prepend :: a -> FingerTree a -> FingerTree a
prepend a Empty = Single a
prepend a (Single b) =
    Deep (One a) Empty (One b)
prepend a (Deep (One b) tree right) =
    Deep (Two a b) tree right
prepend a (Deep (Two b c) tree right) =
    Deep (Three a b c) tree right
prepend a (Deep (Three b c d) tree right) =
    Deep (Two a b)
         (prepend (Node2 c d) tree) right

infixr 5 <|
(<|) :: a -> FingerTree a -> FingerTree a
(<|) = prepend

append :: FingerTree a -> a -> FingerTree a
append Empty a = Single a
append (Single a) b =
    Deep (One a) Empty (One b)
append (Deep left tree (One a)) b =
    Deep left tree (Two a b)
append (Deep left tree (Two a b)) c =
    Deep left tree (Three a b c)
append (Deep left tree (Three a b c)) d =
    Deep left (append tree (Node2 a b))
         (Two c d)

infixl 5 |>
(|>) :: FingerTree a -> a -> FingerTree a
(|>) = append


getFirst :: FingerTree a -> Maybe (a, FingerTree a)
getFirst Empty = Nothing
getFirst (Single a) = Just (a, Empty)
getFirst (Deep (Two a b) tree c) =
    Just (a, Deep (One b) tree c)
getFirst (Deep (Three a b c) tree d) =
    Just (a, Deep (Two b c) tree d)
getFirst (Deep (One a) tree right) =
    Just (a, reduced)
    where
        reduced =
            case getFirst tree of
                Just (Node2 b c, tree') -> Deep (Two b c) tree' right
                Nothing -> reducedRight
        reducedRight =
            case right of
                Two b c -> Deep (One b) Empty (One c)
                Three b c d -> Deep (One b) Empty (Two c d)
                One b -> Single b

height :: Integral i => FingerTree a -> i
height Empty = 0
height (Single _) = 1
height (Deep _ tree _) = height tree + 1
