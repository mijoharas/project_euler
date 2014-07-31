import Data.Numbers.Primes
import qualified Data.Map as M
triangles = scanl1 (+) [1..]
-- had to use a fold and a map, couldn't figure out how to do it in one
divisors = foldr ((*) . (+1)) 1 . map (snd) . divs
           where
             divs = M.toList . (freqMap . primeFactors)
             freqMap x = M.fromListWith (+) [(num, 1) | num <- x]
ans = head $ filter ((>500) . divisors) triangles
