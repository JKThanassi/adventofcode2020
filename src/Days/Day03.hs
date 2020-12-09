module Days.Day03 (solution) where 

import Parser (fileToList)
import qualified Data.Vector as V

data SledState = SledState {dRow :: Int, dCol :: Int, cRow :: Int, cCol :: Int} 

solution :: String -> IO Int
solution path = do
      lines <- fileToList path
      let lov = map V.fromList lines
      let vov = V.fromList lov
      let los = [SledState 1 1 0 0, SledState 1 3 0 0, SledState 1 5 0 0, SledState 1 7 0 0, SledState 2 1 0 0]
      return $ product $ map (\a -> findTrees a vov 0) los

getIdx :: Int -> Int -> Int
getIdx idx len = idx `mod` len

findTrees :: SledState -> V.Vector (V.Vector Char) -> Int -> Int
findTrees state vec treeAcc 
  | cRow state >= V.length vec = treeAcc
  | vec V.! cRow state V.! cCol state == '#' = findTrees (state {cRow=dRow state + cRow state, cCol=getIdx (cCol state + dCol state) $ V.length $ vec V.! 0}) vec (1 + treeAcc)
  | otherwise = findTrees (state {cRow=dRow state + cRow state, cCol=getIdx (cCol state + dCol state) $ V.length $ vec V.! 0}) vec treeAcc

