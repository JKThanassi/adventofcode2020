module Days.Day03 where 

import Parser (fileToList)
import qualified Data.Vector as V

solution :: String -> IO Int
solution path = do
      lines <- fileToList path
      let lov = map V.fromList lines
      let vov = V.fromList lov
      return 3

getIdx :: Int -> Int -> Int
getIdx idx len = idx `mod` len

findTrees :: Int -> Int -> Int -> Int -> V.Vector (V.Vector Char)-> Int -> Int
findTrees _ _ _ _ [] treeAcc = treeAcc
findTrees moveD moveR row col vecLst treeAcc =  3
