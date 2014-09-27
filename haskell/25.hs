-- cabal install digits
import Data.Digits
fibs = 1 : 1 : zipWith (+) fibs (tail fibs) -- I like this function
numberDigits = length . digits 10
result = (length $ takeWhile (\x -> numberDigits x < 1000) fibs) + 1
