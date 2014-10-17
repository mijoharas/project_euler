import System.IO.Unsafe
import Text.Regex
import Data.Char

wordsString = lines $ unsafePerformIO . readFile $ "../problems/words.txt"
myWords = splitRegex (mkRegex ",") $ filter (/='"') $ head wordsString
triangleList = takeWhile (<1000) (scanl1 (+) [1..])
numValue x = sum $ map numberOfChar x
numberOfChar x = ord x - 64
isTriangleWord x = elem (numValue x) triangleList
result = length $ filter isTriangleWord myWords
