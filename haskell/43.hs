import Data.List
import Data.Digits
pandigitals = permutations [0..9]

-- might be able to use lenses instead of this??
allZipWith _ [] _ = True
allZipWith _ _ [] = True
allZipWith f (x:xs) (y:ys) = f x y && allZipWith f xs ys

hasProperty x = x!!0 /= 0 && allZipWith (divFunc x) [1..7] [2,3,5,7,11,13,17]
  where
    divFunc xs start divNum = (unDigits 10) (take 3 (drop (start) xs)) `rem` divNum == 0
result = sum $ map (unDigits 10) $ filter hasProperty pandigitals
