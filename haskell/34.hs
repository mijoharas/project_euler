import Data.Digits (digits)
fac n = facs !! n
facs = scanl (*) 1 [1..]
max_digs = head $ dropWhile (\x -> x * fac 9 > 10^x) [1..]
fact_func x = x == (sum $ map fac (digits 10 x))
result = sum $ filter fact_func [3..10^max_digs]
