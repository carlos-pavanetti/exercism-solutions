module FingerTree (
    FingerTree(..),
    (|>), (<|),
    getFirst, getLast,
    fromList, toList,
    height
) where

data Digit a =
    One a
    | Two a a
    | Three a a a
    deriving Show

data Node a =
    Node2 a a
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
getFirst (Deep (Two a b) tree right) =
    Just (a, Deep (One b) tree right)
getFirst (Deep (Three a b c) tree right) =
    Just (a, Deep (Two b c) tree right)
getFirst (Deep (One a) tree right) =
    Just (a, reduced)
    where
        reduced =
            case getFirst tree of
                Just (Node2 b c, tree') -> Deep (Two b c) tree' right
                Nothing -> reducedRight
        reducedRight =
            case right of
                One x -> Single x
                Two x y -> Deep (One x) Empty (One y)
                Three x y z -> Deep (One x) Empty (Two y z)

getLast :: FingerTree a -> Maybe (FingerTree a, a)
getLast Empty = Nothing
getLast (Single a) = Just (Empty, a)
getLast (Deep left tree (Two a b)) =
    Just (Deep left tree (One a), b)
getLast (Deep left tree (Three a b c)) =
    Just (Deep left tree (Two a b), c)
getLast (Deep left tree (One a)) =
    Just (reduced, a)
    where
        reduced =
            case getLast tree of
                Just (tree', Node2 b c) -> Deep left tree' (Two b c)
                Nothing -> reducedLeft
        reducedLeft =
            case left of
                One x -> Single x
                Two x y -> Deep (One x) Empty (One y)
                Three x y z -> Deep (Two x y) Empty (One z)


height :: Integral i => FingerTree a -> i
height Empty = 0
height (Single _) = 1
height (Deep _ tree _) = height tree + 1
