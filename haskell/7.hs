-- packages, we installed this with cabal install primes and found it on hackage
import Data.Numbers.Primes
main = print $ head $ drop 10000 primes
