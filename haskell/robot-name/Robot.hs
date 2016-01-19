module Robot(robotName, mkRobot, resetName) where

import Control.Monad (liftM)
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
generateNewName = mapM randomRIO [alpha, alpha, num, num, num]
    where
    alpha = ('A', 'Z')
    num = ('0', '9')
