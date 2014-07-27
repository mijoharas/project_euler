-- nice and simple list comprehension and function composition
isPalindrome w = w == reverse w
nums = [x * y | x <- [100..999], y <- [100..999]]
ans = filter (isPalindrome . show) nums
