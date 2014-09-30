import Data.List
import Data.Numbers.Primes
numConsecutivePrimes a b = length $ takeWhile (\x -> funcPrime x a b) [1..]
funcPrime n a b = isPrime (n*n + n*a + b)
test = numConsecutivePrimes 1 41
coefficientsAndNum a b = NumPrimes (numConsecutivePrimes a b) a b
data NumPrimes = NumPrimes Int Int Int deriving (Show)
test2 = coefficientsAndNum 1 41
myMapper func aRangeMin aRangeMax bRangeMin bRangeMax
  = [func a b | a <- [aRangeMin..aRangeMax], b <- [bRangeMin..bRangeMax]]
myRealMapper = myMapper coefficientsAndNum (-1000) 1000 (-1000) 1000
myCompare (NumPrimes a b c) (NumPrimes d e f) = compare a d
maxResult = maximumBy (\a b-> myCompare a b) myRealMapper
getResult (NumPrimes a b c) = b * c
result = getResult maxResult
--slow, but works and makes sense
