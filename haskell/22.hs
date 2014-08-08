import System.IO.Unsafe
import Data.List.Split

myString = unsafePerformIO . readFile $ "names.txt"
otherString = init $ tail $ myString
names = splitOn "\",\"" otherString
-- now we have the names
