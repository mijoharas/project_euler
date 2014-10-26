import Data.Digits
selfPowerSeries limit = sum $ map (\x -> x^x) [1..limit]
result = unDigits 10 $ drop ((length digList) - 10) digList
  where digList = digits 10 $ selfPowerSeries 1000
