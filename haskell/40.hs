import Data.Digits
import Data.List

numbers = concatMap (digits 10) [1..]
indexes = map (\x -> 10^x - 1) [0..6]
result = product $ map (numbers!!) indexes
