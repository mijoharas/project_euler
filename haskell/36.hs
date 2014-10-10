import Data.Digits
import Data.List
isPalindromeBase10And2 x = base2 == reverse base2 && base10 == reverse base10
                           where base2 = digits 2 x
                                 base10 = digits 10 x
result = sum $ filter isPalindromeBase10And2 [1..1000000]
