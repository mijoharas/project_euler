require "prime"
require 'set'

# get 4 digit primes
prime_set = Prime.lazy.map { |x| x }.select { |x| x > 999 }.take_while { |x| x < 10000 }.to_a
# prime_set = [1487, 4817, 8147]  # for testing
prime_set.each_with_index.flat_map { |x, i|
  (0..i-1).map { |j|
    [x, prime_set[j], 2*x - prime_set[j]]
  }.select { |a,b,c|
    c.prime? && Set.new( a.to_s.split(//) ) == Set.new( b.to_s.split(//)) && \
    Set.new(c.to_s.split(//)) == Set.new(a.to_s.split(//))  &&  c < 10000
  }

  }[1].sort.map(&:to_s).join('')
# it's still kinda slow, could be better to do this a different way, maybe the sets are expensive
