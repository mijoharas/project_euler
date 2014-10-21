pentagonalNumbers = map (\x -> x * (3*x - 1) `div` 2) [1..10000]
isInt x = x == fromInteger (round x)
isPentagonal x = isInt ((0.5 + (0.25 + 6 * x)**0.5) / 3)
numbers = [x-y | x <- pentagonalNumbers,
           y <- pentagonalNumbers,
           isPentagonal $ fromInteger (x - y),
           isPentagonal $ fromInteger (x + y)]
result = head numbers
