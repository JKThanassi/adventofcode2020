module Days.Day05 (solution) where

import Parser (fileToList)
import Data.Char (digitToInt)
import Data.List (foldl', (\\))

solution :: String -> IO [Int]
solution path = do
      boardingPasses <- fileToList path
      let rc = map (\b-> ((toDec . exchange 'B' . take 7) b, (toDec . exchange 'R' . drop 7) b)) boardingPasses
      let ids = map (\(r,c) -> (r * 8) + c) rc
      return $ mySeat ids

exchange :: Char -> String -> String
exchange t = map (\c -> if c == t then '1' else '0')

toDec :: String -> Int
toDec = foldl' (\acc x -> acc * 2 + digitToInt x) 0

mySeat :: [Int] -> [Int]
mySeat l = enumFromTo (minimum l) (maximum l) \\ l
