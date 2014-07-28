isDivisibleByNumbersUpTo :: Integer -> Integer -> Bool
isDivisibleByNumbersUpTo num upTo = all (\x -> num `mod` x == 0) [2..upTo]
ans = head [ x | x <- [20,40..], isDivisibleByNumbersUpTo x 20]
