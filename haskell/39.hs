import Control.Arrow
import Data.List
import Data.Ord

myList = [ a + b + c | a <- [1..998],
           b <- [1..a-1],
           a + b < 1000,
           let c = (a**2 + b**2)**0.5,
           a + b + c < 1000,
           isInt c
           ]

isInt x = x == fromInteger (round x)

-- Control.Arrow, I've been wanting to use this for a while, looks cool
frequency = map (length &&& head) . group . sort
result = snd $ head $ sortBy (flip (comparing fst)) (frequency myList)
