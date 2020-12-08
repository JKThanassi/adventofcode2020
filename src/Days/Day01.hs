module Days.Day01 (solution1, solution2) where

import Parser (fileToList)
import qualified Data.IntSet as IntSet

solution1 :: String -> IO Int
solution1 path = do
      input <- fileToList path
      let intin =  map read input
      return $ findSum intin $ genComplimentSet intin

solution2 :: String -> IO Int
solution2 path = do
      input <- fileToList path
      let intin =  map read input
      return $ find3Sum intin $ genComplimentSet intin

find3Sum :: [Int] -> IntSet.IntSet -> Int
find3Sum l s = head [x * y *(2020 - x - y) | x <- l, y <- tail l, IntSet.member (2020 - x - y) s]

findSum :: [Int] -> IntSet.IntSet -> Int
findSum l s = head [x * (2020 - x) | x <- l, IntSet.member (2020 - x) s]


genComplimentSet :: [Int] -> IntSet.IntSet
genComplimentSet l = IntSet.fromList $ map (2020 -) l
