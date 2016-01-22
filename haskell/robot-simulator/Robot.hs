module Robot (
    Bearing(..),
    Robot, mkRobot,
    coordinates, simulate,
    bearing, turnLeft, turnRight
) where

data Bearing = North | East | South | West deriving (Eq, Show)
instance Enum Bearing where
    toEnum 0 = North
    toEnum 1 = East
    toEnum 2 = South
    toEnum 3 = West
    toEnum x = toEnum (x `mod` 4)

    fromEnum x = head (filter ((== x).toEnum) [0..3])


type Coordinates = (Int, Int)
data Robot = Robot Bearing Coordinates deriving (Eq, Show)

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot = Robot

coordinates :: Robot -> Coordinates
coordinates (Robot _ coord) = coord

bearing :: Robot -> Bearing
bearing (Robot faces _) = faces

turnLeft :: Bearing -> Bearing
turnLeft = pred

turnRight :: Bearing -> Bearing
turnRight = succ

advance :: Coordinates -> Bearing -> Coordinates
advance (x, y) faces = case faces of
    North -> (x, y + 1)
    South -> (x, y - 1)
    East  -> (x + 1, y)
    West  -> (x - 1, y)

type Command = Char
type Program = [Command]

simulate :: Robot -> Program -> Robot
simulate = foldl execute
    where
        execute :: Robot -> Command -> Robot
        execute (Robot faces coord) op = case op of
            'A' -> Robot faces (advance coord faces)
            'L' -> Robot (turnLeft faces) coord
            'R' -> Robot (turnRight faces) coord
