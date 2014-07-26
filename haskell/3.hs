isPrime :: Integer->Bool
isPrime x = null [y | y<-[2..floor (sqrt (fromIntegral x))], x `mod` y == 0]

-- primeFactors :: Integer -> [Integer] -- Good form to type this out.
primeFactors x = filter filterfunc primes
                  where
                    primes = filter isPrime (takeWhile (< floor (sqrt (fromIntegral x))) [1..x])
                    filterfunc y = (mod x y) == 0
