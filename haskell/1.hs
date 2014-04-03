numbers x = [a | a <- [1..(x - 1)], a `mod` 3 == 0 || a `mod` 5 == 0 ]
sum_nums x = foldr (+) (head x) (tail x)
-- sum_nums (numbers 1000 )
