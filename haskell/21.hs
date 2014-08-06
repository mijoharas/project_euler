import Data.Numbers.Primes
import qualified Data.Map as M

-- we get the prime factors and then get a frequency list of these
-- (prime factors is a list of all of them, e.g. primeFactors 4 = [2,2];
-- freqMap $ primeFactors 4 = (2,2))
-- if we add one to these and multiply them together we get the number of
-- divisors but we're gonna just combine them to get the factors
divisors x = combinations list_of_nums
           where
             combinations [] = []
             combinations (x:[]) = x
             combinations (x:xs) = combs x xs
             combs as [] = as
             combs as (bs:cs) = combs [a*b | a <- as, b <- bs] cs
             list_of_nums = map (\x -> map ((fst x)^) $ enumFromTo 0 (snd x)) (divs x)
             divs = M.toList . (freqMap . primeFactors)
             freqMap x = M.fromListWith (+) [(num, 1) | num <- x]

prop_div_sum x = (sum (divisors x)) - x

--can't be bothered to cache, just figure out for every number if it's amicable
is_amicable x = x == ((prop_div_sum . prop_div_sum) x) && (x /= prop_div_sum x)

ans = sum $ filter is_amicable [2..10000]
main = print ans
