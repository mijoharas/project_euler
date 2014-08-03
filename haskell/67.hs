import Data.List (tails)
import System.IO.Unsafe

nums_string = lines $ unsafePerformIO . readFile $ "triangle.txt"
nums = map ((map (read:: [Char] -> Integer)) . words) nums_string

-- alright, if we look at the row that is at the second from the bottom, it will
-- always pick the lower of the two available values below it.
-- add this number to its own value and increase up the stack

new_list x = map maximum $ (filter (\x -> length x == 2)) $ map (take 2) (tails x)

list_add [] [] = []
list_add [] x = error "lists aren't the same size"
list_add x [] = error "lists aren't the same size"
list_add (x:xs) (y:ys) = (x+y):(list_add xs ys)

-- this is why I love haskell
ans = foldl1 (\x y -> list_add (new_list x) y) (reverse nums)
main = print ans
