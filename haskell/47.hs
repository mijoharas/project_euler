import Data.Numbers.Primes
import Data.Set (toList, fromList)
import Data.List
mkUniq :: Ord a => [a] -> [a]
mkUniq = toList . fromList

has4PrimeFactors x = length (mkUniq $ primeFactors x) == 4
-- memoization would reduce our computation time by 4 but who cares
result = head $ filter (\x -> all has4PrimeFactors [x..x+3]) [1..1000000]
