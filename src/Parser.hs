module Parser (fileToList)
      where


-- |"Splits a file into a list of its lines
fileToList :: String -> IO [String] 
fileToList path = textToList ('\n' ==) <$> readFile path

-- |"Splits strings line by line into a list of each line"
textToList     :: (Char -> Bool) -> String -> [String]
textToList p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : textToList p s''
                            where (w, s'') = break p s'
