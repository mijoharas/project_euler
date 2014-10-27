import Data.Numbers.Primes
import Data.Digits
import Data.List
import qualified Data.Set as S

primeList = takeWhile (<= 9999) $ dropWhile (<1000) primes

arePermutations a b c = length (dig a) == length (dig b) &&
                        length (dig b) == length (dig c) &&
                        makeSet a == makeSet b &&
                        makeSet b == makeSet c
                        where dig num = digits 10 num
                              makeSet x = S.fromList (dig x)
numbers = [[a,b,c] | a <- primeList,
                     b <- primeList,
                     let c = b + (b - a),
                     a > b,
                     isPrime c,
                     arePermutations a b c]

result = unDigits 10 $ concatMap (digits 10) $ sort $ last numbers
