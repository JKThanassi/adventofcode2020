module Days.Day06 (solution) where

import Data.List (nub, intersect)
import Data.List.Split (splitOn)

solution path = do
      l <- lines <$> readFile path
      let groups = splitOn [""] l
      return $ part2 groups

      

part1 :: [[String]] -> Int
part1 = sum . map (length . nub . concat)

part2 :: [[String]] -> Int
part2 = sum . map (length . foldr1 intersect)
