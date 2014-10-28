require "prime"

limit = 1000000
primes = Prime.lazy.map { |x| x}.take_while { |x| x < limit }.to_a
# p primes
candidates = (21..30).flat_map { |dig_size|
  p dig_size
  (1..primes.size).map { |prime_no|
    [dig_size, primes[prime_no..prime_no + dig_size].reduce(:+) ]
  }.select { |size, num| num && primes.include?(num) }
}

p candidates
# this might reveal the right answer but it's so damn slow as to be useless
# not sure why it's so slow though, maybe I should profile, is it because I'm
# taking a slice of the large array? otherwise it should just be all the primes under a million
# which is 70,000 odd iirc and then some additions for each of them, should be order n


# better idea, think 8 queens problem or eulers method, this can be done better
