import qualified Days.Day01 as D1 (solution1, solution2)
import qualified Days.Day02 as D2 (solution, solution2)
import qualified Days.Day03 as D3 (solution)
import qualified Days.Day04 as D4 (solution)
import qualified Days.Day05 as D5 (solution)

main :: IO ()
main = do 
    result <- D5.solution "src/inputs/day05.txt"
--    result2 <- D2.solution2 "src/inputs/day02.txt"
    print result  
--    print result2  

