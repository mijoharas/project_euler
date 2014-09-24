import Data.Numbers.Primes
import qualified Data.Map as M

isAbundant n = (prop_div_sum n) > n

-- from question 21
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

-- from question 12
other_divisors = foldr ((*) . (+1)) 1 . map (snd) . divs
                  where
                    divs = M.toList . (freqMap . primeFactors)
                    freqMap x = M.fromListWith (+) [(num, 1) | num <- x]

prop_div_sum x = (sum (divisors x)) - x

abunList = filter isAbundant $ takeWhile (< 28123) [1..]

-- iterate through twice and make all sums then filter numbers that aren't
-- in that list?
