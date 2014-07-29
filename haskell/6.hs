nums = [1.0..100.0]
square_sum = (sum nums)**2
sum_square = sum (map (**2) nums)
ans = square_sum - sum_square
-- Note, print is required or the type is wrong (needs some IO)
main = print ans
