import qualified Days.Day01 as D1 (solution1, solution2)
import qualified Days.Day02 as D2 (solution, solution2)

main :: IO ()
main = do 
    result <- D2.solution "src/inputs/day02.txt"
    result2 <- D2.solution2 "src/inputs/day02.txt"
    print result  
    print result2  

