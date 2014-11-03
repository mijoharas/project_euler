import Data.Numbers.Primes
import qualified Data.Vector as V
import Data.List

limit = 1000000
myPrimes = V.fromList $ takeWhile (<limit) primes
pLength = V.length myPrimes
bigPrimeList = [[endIndex, prime, startIndex] | startIndex <- [1..pLength],
                endIndex <- [21..600],
                startIndex + endIndex < pLength,
                let slice = V.slice startIndex endIndex myPrimes,
                    let prime = sum $ V.toList slice,
                    prime < limit,
                    isPrime prime
                ]

result = last $ sort bigPrimeList
