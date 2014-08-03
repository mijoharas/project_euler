import Data.List (tails)
nums_string = [
  "75",
  "95 64",
  "17 47 82",
  "18 35 87 10",
  "20 04 82 47 65",
  "19 01 23 75 03 34",
  "88 02 77 73 07 63 67",
  "99 65 04 28 06 16 70 92",
  "41 41 26 56 83 40 80 70 33",
  "41 48 72 33 47 32 37 16 94 29",
  "53 71 44 65 25 43 91 52 97 51 14",
  "70 11 33 28 77 73 17 78 39 68 17 57",
  "91 71 52 38 17 14 91 43 58 50 27 29 48",
  "63 66 04 68 89 53 67 30 73 16 69 87 40 31",
  "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
  ]

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
