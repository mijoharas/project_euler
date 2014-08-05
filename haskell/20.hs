import Data.Digits (digits)
import Data.List (foldl1')

factorial 0 = 1
factorial n = foldl1' (*) [1..n]
-- 10 is the base we use
ans = sum $ digits 10 $ factorial 100
main = print ans
