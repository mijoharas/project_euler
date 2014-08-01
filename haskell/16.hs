import Data.List (foldl1')
import Data.Digits (digits)
-- seems that this function is needed, ** changes to double, ^ is for ints, there
-- are more still
num = 2 ^ 1000
my_digs = digits 10 num
-- due to tail recursion, this is better to use when we are looking at the entire list
ans = foldl1' (+) my_digs
