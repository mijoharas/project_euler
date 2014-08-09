import System.IO.Unsafe
import Data.List.Split

myString = unsafePerformIO . readFile $ "names.txt"
otherString = init $ tail $ myString
names = splitOn "\",\"" otherString
sortedList = sort names
-- now we have the names
