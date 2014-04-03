require "prime"
limit = 10000
odd_composites = (1..limit).map { |x| 2 * x + 1}.select { |x| !x.prime? }
primes = Prime.lazy.map { |x| x  }.take_while { |x| x < limit }.to_a
# set cover problem?
# when I can be bothered, clean this up, can use inverse function instead of square.
goldbach_numbers = primes.flat_map { |prime| (1..limit).map { |num| 2 * num**2 + prime} }.uniq
# ugly ugly ugly solution, but I can't be bothered to tighten the bounds / change it.
# copied from terminal.
odd_composites.select {|x| !goldbach_numbers.include?(x)}.min
