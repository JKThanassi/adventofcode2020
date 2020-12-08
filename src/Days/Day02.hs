module Days.Day02 (solution, solution2) where

import Parser (fileToList)
import Text.Regex.TDFA ((=~))

solution :: String -> IO Int
solution path = do
      pwds <- fileToList path
      return $ getValidPwds . map (isValid . extractLine) $ pwds 

solution2 :: String -> IO Int
solution2 path = do
      pwds <- fileToList path
      return $ getValidPwds . map (isValid2 . extractLine) $ pwds 


getValidPwds :: [Bool] -> Int
getValidPwds = foldl (\a b -> if b then 1 + a else 0 + a) 0 

isValid :: (Int, Int, Char, String) -> Bool
isValid (min, max, c, p) = x >= min && x <= max
      where
            x = length $ filter (== c)  p

isValid2 :: (Int, Int, Char, String) -> Bool
isValid2 (p1, p2, c, s) = xor (s!!(p1-1) == c) (s!!(p2-1) == c)

xor :: Bool -> Bool -> Bool
xor a b = a /= b

extractLine :: String -> (Int,Int,Char,String)
extractLine s = case s =~ pwdRegex :: (String, String, String, [String]) of
                  (_, _, _,[min, max, char, str]) -> (read min, read max, head char, str)

      where
      pwdRegex = "([0-9]+)-([0-9]+) (.): (.+)"
      

