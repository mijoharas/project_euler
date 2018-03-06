{-# LANGUAGE RankNTypes #-}
import Data.Numbers.Primes
import qualified Data.Vector as V
import Data.List

type ReducingFn a r = r -> a -> r
type Transducer a b = forall r . ReducingFn a r -> ReducingFn b r

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
-- well that takes 7 minutes, lets see if we can do better
-- we can iterate over one the sequence and then take off the start of the
-- sequence, how the hell do we do that in haskell
-- makeTransducer f r

t_dub :: Num a => Transducer a a
t_dub f r b = f r (2 * b)

t_rep :: Transducer a a
t_rep f r b = f (f r b) b

t_parse :: Read a => Transducer a String
t_parse f r s = f r $ read s

t_root :: Transducer Double Integer
t_root f r i = f r $ (**) 2.0 (1.0/(fromInteger i))
