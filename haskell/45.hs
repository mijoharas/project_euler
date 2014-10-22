import Numeric

hexagonalNumbers = scanl (+) 1 [5,9..] -- triangles are a subset of hex
isInt x = x == fromInteger (round x)
isPentagonal x = isInt ((0.5 + (0.25 + 6 * x)**0.5) / 3)
result =  showFFloat Nothing (head [x | x <- hexagonalNumbers, x > 40755, isPentagonal x]) ""
