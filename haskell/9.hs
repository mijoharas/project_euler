-- very simplistic brute force list comprehension
ans = [(x*y*z)| x <- [1..1000], y <- [1..1000], z <- [1..(1000 - x - y)], x**2 + y**2 == z**2, x + y + z == 1000]
main = print ans