import Data.List
import Data.Ord (comparing)
import qualified Data.MemoCombinators as Memo
-- Gonna use this as an excuse to use some algebraic datatypes and practice that
-- algebraic datatypes are now f-ing up my memoization, gonna implement a simple
-- memoization and then postconvert to my type so that I still use maximumBy
-- as that seems worth remembering
-- still slower than I'd like but we could speed up with tree to make the lookups log(n)
-- or a map, this'll do for now

data Collatz = Coll Int Int deriving Show

collatz = Memo.arrayRange (1, 1000000) collatz'
          where
            collatz' 1 = 1
            collatz' x
              | even x = 1 + collatz (x `div` 2)
              | otherwise = 1 + collatz (3*x + 1)

evaluateSequence (Coll b c) = Coll b (collatz b)
valueCollatz (Coll b c) = c

maxIndex = snd . foldl1' max . (flip zip [0..])

euler14 n = (maxIndex lengths) + 1
  where
    lengths = map collatz [1..n-1]

maxCollatz = maximumBy (comparing valueCollatz)

makeCollatz num = Coll num 1
nums = map makeCollatz [1..1000000]
ans = maxCollatz $ map evaluateSequence nums
