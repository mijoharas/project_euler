import Data.List
import Data.Digits (digits)

-- n is our power (for testing)
maxValue n = fst $ head $ filter (\(a, b) -> a < b) $ zip (map (9^n*) [1..]) (map (10^) [1..])
memoizePowers n = (map (^n) [0..9] !!)
powerDigits n x = sum $ map (memoizePowers n) (digits 10 x)
numSumFifthPowerDigits = filter (\n -> n == (powerDigits 5 n)) [2..(maxValue 5)]
result = sum numSumFifthPowerDigits
