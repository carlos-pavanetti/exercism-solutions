{-# LANGUAGE CPP #-}
module Deque where

import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Data.Maybe (fromJust, isNothing)

import FingerTree

#ifdef DEBUG
import Data.Text.Unsafe (inlinePerformIO)

instance Show a => Show (IORef a) where
    show ioref = show (inlinePerformIO (readIORef ioref))
#endif

type Deque a = IORef (FingerTree a)

mkDeque :: IO (Deque a)
mkDeque = newIORef Empty

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
    if isNothing fstPair
        then return Nothing
        else do
            let (first, nfg) = fromJust fstPair
            writeIORef deque nfg
            return (Just first)

pop :: Deque a -> IO (Maybe a)
pop deque = do
    fg <- readIORef deque
    let fstPair = getLast fg
    if isNothing fstPair
        then return Nothing
        else do
            let (nfg, _last) = fromJust fstPair
            writeIORef deque nfg
            return (Just _last)
