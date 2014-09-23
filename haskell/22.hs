import System.IO.Unsafe
import Data.List.Split
import Data.List
import Data.Char

myString = unsafePerformIO . readFile $ "names.txt"
otherString = init $ tail $ myString
names = splitOn "\",\"" otherString
sortedList = sort names
score =  sum . map (\char -> ord char - ord 'A' + 1)
result = sum $ zipWith (\x y -> (score x) * y) sortedList [1..]
-- now we have the names
-- we then need to apply our function to these names
