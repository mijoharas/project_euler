import Data.Numbers.Primes
import Data.List
import qualified Data.Map as M
import qualified Data.Set as S

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

-- from question 12 putting here so that they're both visible
other_divisors = foldr ((*) . (+1)) 1 . map (snd) . divs
                  where
                    divs = M.toList . (freqMap . primeFactors)
                    freqMap x = M.fromListWith (+) [(num, 1) | num <- x]

prop_div_sum x = (sum (divisors x)) - x

limit = 28123

abunList = filter isAbundant $ takeWhile (< limit) [1..]

-- iterate through twice and make all sums then filter numbers that aren't
-- in that list?
testList = [1,2,2,3,4,5]
deDup list = (S.toList . S.fromList) $ concat list
listOfAbunSums = deDup $ map sumMapper $ tails abunList
          where sumMapper [] = []
                sumMapper (a:b) = sumMap a (a:b)
                --create our sumMap function but stop once we get to the limit
                sumMap a b = map (+ a) $ takeWhile (\x -> (x + a) <= limit) b
-- this is like set difference
difference = [1..limit] \\ listOfAbunSums
result = sum difference

-- kinda slow, good enough (chuck in binary search)
