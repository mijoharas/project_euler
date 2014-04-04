maximum x = foldr max (head x) (tail x)
-- alright, lets do this right and get a decend prime function to loop over.
-- http://www.haskell.org/haskellwiki/99_questions/Solutions/31
primes = 2 : gaps 3 (join [[p*p, p*p+2*p..] | p <- primes'])
         -- alright, so we append 2 to the list created by gaps 3 and joining our
         -- gaps for each of the primes (from psquared in multiples of 2 as
         -- the primes are odd and we go over them in 2's anyways. )
         where
           -- So this is what we use for our primes function, we're doing the same
           -- trick but swapping 2 for 3 and 3 for 5
           primes' = 3 : gaps 5 (join [[p*p, p*p+2*p..] | p <- primes'])
           join ((x:xs):t) = x : union xs (join (pairs t))
           pairs ((x:xs):ys:t) = (x : union xs ys) : pairs t
           gaps k xs@(x:t) | k == x = gaps (k+2) t
                           | True   = k : gaps (k+2) xs

union (x:xs) (y:ys) = case (compare x y) of
  LT -> x : union xs (y:ys)
  EQ -> x : union xs ys
  GT -> y : union (x:xs) ys
union xs [] = xs
union [] ys = ys


-- primeFactors :: Integer -> [Integer] -- Good form to type this out.
