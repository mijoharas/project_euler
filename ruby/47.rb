# We can use smart boyce-moore style thingy, but why bother...
# (don't use premature optimisation)
require "prime"
factors = ->(x) {x.prime_division.size >= 4}
(1..1000000).lazy.map { |x| x }.select { |x| factors[x] && factors[x + 1] && factors[x+2] && factors[x+3]}.take(1).to_a
