-- very simplistic brute force list comprehension
-- N.B. z must be taken from a list even with a single value.
ans = [(x*y*z)| x <- [1..1000], y <- [1..(1000 - x)], z <- [(1000 - x - y)], x**2 + y**2 == z**2]
main = print ans
