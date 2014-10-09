import Data.Digits
import Data.List
import Data.Numbers.Primes
reorderings xs = take len . map (take len) . tails . cycle $ xs
  where len = length xs
cycledNums x = map (unDigits 10) $ (reorderings . digits 10) x
isCyclicPrime x = all isPrime $ cycledNums x
primeList = takeWhile (<1000000) primes
result =  length $ filter isCyclicPrime primeList
