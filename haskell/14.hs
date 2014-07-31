-- Gonna use this as an excuse to use some algebraic datatypes and practice that
-- fields are number, current_num and no_of_steps
data Collatz = Coll Integer Integer Integer deriving Show
-- first version crazy slow, memoize crap to speed up
evaluateSequence (Coll a 1 c) = Coll a 1 c
evaluateSequence (Coll a b c) = if b `mod` 2 == 0
                                then evaluateSequence $ Coll a (b `div` 2) (c+1)
                                else evaluateSequence $ Coll a ((3*b)+1) (c+1)
maxCollatz [] = error "empty list"
maxCollatz [x] = x
maxCollatz ((Coll a b c):xs)
  | c > cmax = Coll a b c
  | otherwise = (Coll amax bmax cmax)
  where (Coll amax bmax cmax) = maxCollatz xs

makeCollatz num = Coll num num 1
nums = map makeCollatz [1..1000000]
ans = maxCollatz $ map evaluateSequence nums
