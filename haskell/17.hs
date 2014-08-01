import Data.List (foldl1')
single = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teen = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
        "seventeen", "eighteen", "nineteen"]
-- Note, they use american 'forty'
tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
        "ninety"]
hundreds = ["hundred"]

lettersInNumber x
  | x == 0 = ""
  | x < 10 = single !! (x - 1)
  | 10 < x && x < 20 = teen !! (x - 11)
  | x `mod` 10 == 0 && x < 100 = tenFunc x
  | x < 100 = (tenFunc x) ++ (lettersInNumber (reduceFunc x 10))
  | 100 <= x && x < 1000 && x `mod` 100 == 0 = (hundredFunc x) ++ hundreds !! 0 ++ (lettersInNumber (reduceFunc x 100))
  | 100 <= x && x < 1000 = (hundredFunc x) ++ hundreds !! 0 ++ "and" ++ (lettersInNumber (reduceFunc x 100))
  | x == 1000 = "onethousand"
    where
      tenFunc x = tens !! ((x `div` 10) - 1)
      hundredFunc x = single !! ((x `div` 100) - 1)
      reduceFunc x y = x - ((x `div` y) * y)

test = map lettersInNumber [0..1000]
ans = foldl1' (+) $ map length test
main = print ans
