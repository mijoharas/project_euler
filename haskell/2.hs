sum_nums x = foldr (+) (head x) (tail x)
fibs = 1 : 1 : zipWith (+) fibs (tail fibs) -- I like this function
nums = sum_nums [x | x <- takeWhile (< 4000000) fibs, even x]
