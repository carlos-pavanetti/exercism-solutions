module LinkedList (
    LinkedList(..),
    nil, isNil, new,
    toList, fromList,
    reverseLinkedList
) where

data LinkedList a = Nil | Node { datum :: a, next :: LinkedList a } deriving (Show)
instance Foldable LinkedList where
    foldr _ acc Nil = acc
    foldr f acc (Node value nxt) = f value (foldr f acc nxt)

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Node

toList :: LinkedList a -> [a]
toList Nil = []
toList (Node value nxt) = value : toList nxt

fromList :: [a] -> LinkedList a
fromList = foldr Node Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl (flip Node) Nil
