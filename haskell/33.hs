import Data.Digits (digits)

numPairs = [(num,denom) | num <-[11..99], denom <-[num+1..99]]
-- digitCancellingPair:: (Int,Int) -> Float
digitCancellingPair (num, denom) =
  (fromIntegral a / fromIntegral b) == (fromIntegral num / fromIntegral denom) &&
  my_second num == my_first denom
    where
        a = my_first num
        b = my_second denom
        my_first = head . digits 10
        my_second = head . tail . digits 10

my_list = filter digitCancellingPair numPairs
result = foldl1 (*) $ map (\(a,b) -> fromIntegral a / fromIntegral b) my_list
