module BankAccount(
    BankAccount(..),
    openAccount, closeAccount,
    getBalance, incrementBalance
) where

import Data.Maybe(isNothing, fromJust)
import Control.Monad(unless)
import Control.Concurrent(MVar, newMVar, readMVar, modifyMVar_)

data BankAccount = BankAccount (MVar (Maybe Int))

openAccount :: IO BankAccount
openAccount = do
    balance <- newMVar (Just 0)
    return (BankAccount balance)

closeAccount :: BankAccount -> IO ()
closeAccount (BankAccount balance) = modifyMVar_ balance (\_ -> return Nothing)

getBalance :: BankAccount -> IO (Maybe Int)
getBalance (BankAccount balance) = readMVar balance

incrementBalance :: BankAccount -> Int -> IO (Maybe Int)
incrementBalance (BankAccount prevBalance) amount = do
    balance <- readMVar prevBalance
    unless (isNothing balance) $
        modifyMVar_ prevBalance (return . Just . (+ amount) . fromJust)
    readMVar prevBalance
