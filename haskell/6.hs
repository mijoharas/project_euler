nums = [1.0..100.0]
square_sum = (sum nums)**2
sum_square = sum (map (**2) nums)
ans = square_sum - sum_square
main = print ans
