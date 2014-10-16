import qualified Data.Set as S
import Data.Digits
import Data.Numbers.Primes

isPandigital x y = length nums == y && S.fromList nums == setMemo y
                  where nums = (digits 10 x)
setMemo x = setList !! (x-1)
  where setList = [ S.fromList [1..x] | x <- [1..9] ]

pandigitalLength x = isPandigital x (length (digits 10 x))
-- kinda slow but it gets there.
result = maximum $ filter pandigitalLength $ takeWhile (<7654321) primes
