module Robot(robotName, mkRobot, resetName) where

import Control.Monad (liftM, replicateM)
import Control.Concurrent (MVar, newMVar, readMVar, modifyMVar_)
import System.Random (randomRIO)

data Robot = Robot (MVar String)

robotName :: Robot -> IO String
robotName (Robot name) = readMVar name

mkRobot :: IO Robot
mkRobot = liftM Robot (generateNewName >>= newMVar)

resetName :: Robot -> IO ()
resetName (Robot name) = modifyMVar_ name (const generateNewName)

generateNewName :: IO String
generateNewName = do
    a2 <- replicateM 2 (randomRIO alpha)
    n3 <- replicateM 3 (randomRIO num)
    return (a2 ++ n3)
    where
        alpha = ('A', 'Z')
        num = ('0', '9')
