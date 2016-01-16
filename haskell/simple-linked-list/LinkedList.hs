module LinkedList (
    LinkedList(..),
    nil, isNil, new,
    next, datum,
    toList, fromList,
    reverseLinkedList
) where

data LinkedList a = Nil | Node a (LinkedList a) deriving(Show)

nil :: LinkedList a
nil = Nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Node

next :: LinkedList a -> LinkedList a
next (Node _ nxt) = nxt

datum :: LinkedList a -> a
datum (Node value _) = value

toList :: LinkedList a -> [a]
toList Nil = []
toList (Node value nxt) = value : toList nxt

fromList :: [a] -> LinkedList a
fromList [] = Nil
fromList (x:xs) = Node x (fromList xs)

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList
