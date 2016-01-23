module BST(
    bstLeft, bstRight, bstValue,
    singleton, insert,
    fromList, toList
) where

data BST a = Nil | Node a (BST a) (BST a) deriving Eq

instance Show a => Show (BST a) where
    show Nil = "¬"
    show (Node value left right) =
        "(" ++ show value ++ show left ++ show right ++ ")"

singleton :: a -> BST a
singleton value = Node value Nil Nil

bstLeft :: BST a -> Maybe (BST a)
bstLeft Nil = Nothing
bstLeft (Node _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Nil = Nothing
bstRight (Node _ _ right) = Just right

bstValue :: BST a -> a
bstValue Nil = error "Caralho"
bstValue (Node value _ _) = value

insert :: (Eq a, Ord a) => a -> BST a -> BST a
insert value Nil = singleton value
insert new_value (Node value left right)
    | new_value <= value = Node value (insert new_value left) right
    | otherwise          = Node value left (insert new_value right)

prefix :: BST a -> [a]
prefix Nil = []
prefix (Node value left right) = value: prefix left ++ prefix right

infix' :: BST a -> [a]
infix' Nil = []
infix' (Node value left right) = infix' left ++ [value] ++ infix' right

posfix :: BST a -> [a]
posfix Nil = []
posfix (Node value left right) = posfix left ++ posfix right ++ [value]

toList :: BST a -> [a]
toList = infix'

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) Nil
