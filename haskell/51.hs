import Data.Digits
import Data.Numbers.Primes
import Data.List
import qualified Data.Sequence as S
-- Wow, lenses are crazy, still don't understand them
import Control.Lens

numberPrimeReplacements num replaceIndexes = filter isPrime newNumbers
  where newNumbers = map (unDigits 10 . replaceIndices replaceIndexes (digits 10 num)) (iterList replaceIndexes)
        iterList rInd
          | elem 0 rInd = [1..9]
          | otherwise   = [0..9]


-- this replaceIndices function is useful
replaceIndices indices list num = over (elements (flip elem indices)) (const num) list

indexPermutations num = tail $ subsequences [0..((length (digits 10 num)) - 1)]
-- pretty damn slow but I learnt something so I'm happy with it
--- dammit, still not right, almost there
result = head [minimum nums | x <- primes,
               let nums = (filter (\y -> length (numberPrimeReplacements x y) == 8) (indexPermutations x)),
                     nums /= []]
