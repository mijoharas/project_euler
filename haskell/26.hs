import Data.List
import Data.Numbers.Primes
myList = takeWhile (<1000) primes
noCycle n = headOrZero $ filter (\x -> 10^x `mod` n == 1 `mod` n) [1..n]
headOrZero (a:as) = a
headOrZero [] = 0
secondList = map (\x -> [noCycle x, x]) myList
result = maximumBy (\x y -> head x `compare` head y) secondList
-- noCycles = head . filter ()
