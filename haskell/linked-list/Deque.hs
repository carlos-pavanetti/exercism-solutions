module Deque where

import Data.Maybe
import Data.Text.Unsafe
import Control.Monad
import Control.Concurrent
import GHC.Prim
import Control.Monad.Fix

data Node a = Node {prev :: IONode a, next :: IONode a, item :: a} deriving Show
type IONode a = MVar (Maybe (Node a))

data Deque a = Deque {first :: IONode a, _last :: IONode a} deriving Show

instance Show a => Show (MVar a) where
    show mvar = show (inlinePerformIO (readMVar mvar))

mkNode :: a -> IO (Node a)
mkNode value = do
    prevNode <- newMVar Nothing
    nextNode <- newMVar Nothing
    return Node {prev = prevNode, next = nextNode, item = value}

mkDeque :: IO (Deque a)
mkDeque = do
    fstNode <- newMVar Nothing
    lstNode <- newMVar Nothing
    return Deque {first = fstNode, _last = lstNode}

push :: Deque a -> a -> IO ()
push deque value = do
    return ()
