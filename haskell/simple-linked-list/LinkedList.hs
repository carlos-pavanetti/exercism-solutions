module LinkedList (
    LinkedList(..),
    nil, isNil, new,
    toList, fromList,
    reverseLinkedList
) where

data LinkedList a = Nil | Node { datum :: a, next :: LinkedList a } deriving (Show)

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
reverseLinkedList = reverseAux Nil
    where
        reverseAux acc Nil = acc
        reverseAux acc (Node value nxt) = reverseAux (Node value acc) nxt
