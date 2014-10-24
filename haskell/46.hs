import Data.Numbers.Primes
import Data.Set (toList, fromList)
import Data.List
mkUniq :: Ord a => [a] -> [a]
mkUniq = toList . fromList
limit = 10000
oddComposites = filter (\x -> not (isPrime x) && odd x) [1..limit]
myPrimes = takeWhile (<limit) primes
mySquares = map (^2) [1..limit]
goldbachNumbers = mkUniq [x| p <- myPrimes, s <- mySquares, let x = p + 2 * s, x < limit]
result = oddComposites \\ goldbachNumbers
