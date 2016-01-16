module School(School, empty, add, sorted, grade) where

import Data.List(sort)

data School = Empty | Grade Int [String] School
type Grade = (Int, [String])

empty :: School
empty = Empty

add :: Int -> String -> School -> School
add gradeNum student Empty = Grade gradeNum [student] empty
add gradeNum student (Grade thisGrade list school)
    | gradeNum == thisGrade = Grade thisGrade (student:list) school
    | otherwise = Grade thisGrade list (add gradeNum student school)

sorted :: School -> [Grade]
sorted Empty = []
sorted (Grade gradeNum list school) =
    minorGrades ++ [(gradeNum, sort list)] ++ majorGrades
    where
        sortedSchool = sorted school
        minorGrades  = [grd | grd <- sortedSchool, fst grd < gradeNum]
        majorGrades  = [grd | grd <- sortedSchool, fst grd >= gradeNum]

grade :: Int -> School -> [String]
grade _ Empty = []
grade gradeNum (Grade thisGrade list school)
    | gradeNum == thisGrade = list
    | otherwise = grade gradeNum school
