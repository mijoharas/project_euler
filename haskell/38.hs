import qualified Data.Set as S
import Data.Foldable (toList)
import Data.Digits
import Data.List

isPandigital x = S.fromList nums == S.fromList [1..9] && length nums == 9
                 where nums = (digits 10 x)

makeNums a b = unDigits 10 $ concatMap (digits 10)  [a*c | c <- [1..b]]

pandigitals = [ x |a <- [1..9999],
                let max_num = ceiling (9.0/(fromIntegral (length (digits 10 a)))),
                b <-[2..max_num],
                let x = makeNums a b,
                isPandigital x]

result = maximum pandigitals
