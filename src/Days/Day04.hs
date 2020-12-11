module Days.Day04 (solution) where

import Data.List.Split (splitOn, splitOneOf)
import Text.Regex.TDFA ((=~))

data Passport = Passport {byr :: Maybe String,iyr :: Maybe String,eyr :: Maybe String,hgt :: Maybe String,hcl :: Maybe String,ecl :: Maybe String,pid :: Maybe String,cid :: Maybe String}

defaultPass= Passport Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

solution :: String -> IO Int
solution path = do
      input <- readFile path
      return $ sumValid $ map ((pairBlockToPassport defaultPass . toTuple) . splitPairs) (( blockToPairs .  strToBlock ) input)



strToBlock :: String -> [String]
strToBlock = splitOn "\n\n"

blockToPairs :: [String] -> [[String]]
blockToPairs = map $ splitOneOf "\n "

splitPairs :: [String] -> [[String]]
splitPairs = map $ splitOn ":"

toTuple :: [[String]] -> [(String, String)]
toTuple [] = []
toTuple ([x,y] : xs) = (x,y) : toTuple xs
toTuple a = error $ show a

pairBlockToPassport :: Passport-> [(String, String)] -> Passport
pairBlockToPassport acc [] = acc
pairBlockToPassport acc (("byr", y) : xs) = pairBlockToPassport (acc {byr= Just y}) xs
pairBlockToPassport acc (("iyr", y) : xs) = pairBlockToPassport (acc {iyr= Just y}) xs
pairBlockToPassport acc (("eyr", y) : xs) = pairBlockToPassport (acc {eyr= Just y}) xs
pairBlockToPassport acc (("hgt", y) : xs) = pairBlockToPassport (acc {hgt= Just y}) xs
pairBlockToPassport acc (("hcl", y) : xs) = pairBlockToPassport (acc {hcl= Just y}) xs
pairBlockToPassport acc (("ecl", y) : xs) = pairBlockToPassport (acc {ecl= Just y}) xs
pairBlockToPassport acc (("pid", y) : xs) = pairBlockToPassport (acc {pid= Just y}) xs
pairBlockToPassport acc (("cid", y) : xs) = pairBlockToPassport (acc {cid= Just y}) xs

validatePassport :: Passport -> Bool
validatePassport (Passport (Just b) (Just i) (Just e) (Just hg) (Just hc) (Just ex) (Just p)  _) = validateNumber (read b) 1920 2020 && validateNumber (read i) 2010 2020 && validateNumber (read e) 2020 2030 && validateHeight hg && validateHair hc && validateEye ex && validatePid p

validatePassport _ = False

validateNumber :: Int -> Int -> Int -> Bool
validateNumber actual min max = (actual >= min) && (actual <= max)

validateHair :: String -> Bool
validateHair h = h =~ "^#[0-9a-f]{6}$"

validateEye :: String -> Bool
validateEye e = e =~ "blu|amb|brn|gry|grn|hzl|oth"


validatePid:: String -> Bool
validatePid e = e =~ "^0*[1-9][0-9]{8}$"

validateHeight :: String -> Bool
validateHeight h = case h =~ "([0-9]+)(in|cm)" :: (String, String, String, [String]) of
                     (_,_,_,[val,"in"]) -> validateNumber (read val)  59 76
                     (_,_,_,[val,"cm"]) -> validateNumber (read val) 150 193
                     _ -> False

sumValid :: [Passport] -> Int
sumValid = foldl (\c p -> if validatePassport p then 1 + c else c) 0

