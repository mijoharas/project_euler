import Data.List

maxValue = fst $ head $ filter (\(a, b) -> a < b) $ zip (map (9**5*) [1..]) (map (10**) [1..])
