module BankAccount(
    BankAccount(..),
    openAccount, closeAccount,
    getBalance, incrementBalance
) where

import Control.Monad(liftM)
import Control.Concurrent(MVar, newMVar, readMVar, modifyMVar_)

data BankAccount = BankAccount (MVar (Maybe Int))

openAccount :: IO BankAccount
openAccount = liftM BankAccount (newMVar (Just 0))

closeAccount :: BankAccount -> IO ()
closeAccount (BankAccount balance) = modifyMVar_ balance (return.const Nothing)

getBalance :: BankAccount -> IO (Maybe Int)
getBalance (BankAccount balance) = readMVar balance

incrementBalance :: BankAccount -> Int -> IO (Maybe Int)
incrementBalance (BankAccount prevBalance) amount = do
    newBalance <- fmap (+amount) <$> readMVar prevBalance
    modifyMVar_ prevBalance (return.const newBalance)
    return newBalance
