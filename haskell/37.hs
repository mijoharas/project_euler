import Data.Numbers.Primes
import Data.Digits
import Data.List

bothTruncateable x = all (isPrime . (unDigits 10)) list
                 where
                   list = (init $ tails (digits 10 x)) ++ (tail (inits (digits 10 x)))
result = sum $ take 11 $ drop 4 $ filter bothTruncateable primes
