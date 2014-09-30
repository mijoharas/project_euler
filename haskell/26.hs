import Data.List
import Data.Numbers.Primes
primeList = takeWhile (<1000) primes
noCycles n = headOrZero $ filter (\x -> 10^x `mod` n == 1 `mod` n) [1..n]
headOrZero (a:as) = a
headOrZero [] = 0
secondList = map (\x -> [noCycles x, x]) primeList -- create a list with both num and result
result = maximumBy (\x y -> head x `compare` head y) secondList
