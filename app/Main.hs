import qualified Days.Day01 as D1 (solution1, solution2)
import qualified Days.Day02 as D2 (solution, solution2)
import qualified Days.Day03 as D3 (solution)
import qualified Days.Day04 as D4 (solution)

main :: IO ()
main = do 
    result <- D4.solution "src/inputs/day04.txt"
--    result2 <- D2.solution2 "src/inputs/day02.txt"
    print result  
--    print result2  

