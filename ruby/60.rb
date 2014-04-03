require 'prime'

# proposed solution, let's think about the problem, we need to get a set of 5 primes
# that are all concatenatable with one another to form further primes.
# we can create a dict of all prime pairs under a million or so and then find the
# corresponding ring of five that we minimise.

set_size = 4
satisfies_cond = -> a, b {(a.to_s + b.to_s).to_i.prime? && (b.to_s + a.to_s).to_i.prime? }

update_prime_map = -> x, y {
  if prime_map[x]
    prime_map[x] << y
    if prime_map[x].size >= set_size
      p prime_map[x]
    end
  else
    prime_map[x] = [y]
  end
  if prime_map[y]
    prime_map[y] << x
    if prime_map[y].size >= set_size
      p prime_map[y]
    end
  else
    prime_map[y] = [x]
  end
}

prime_map = {}
Prime.lazy.take_while { |x| x < 1000 }.map { |prime|
  Prime.lazy.take_while { |x| x < prime }.each { |other_prime|
    if satisfies_cond[prime, other_prime]
      update_prime_map[prime, other_prime]
    end
  }.to_a
}.to_a

# now we'd need to find a unique set from here, I'm not sure if I like this method...
# we modify the update_prime_map function to only include sets.
# i prefer lazy evaluation but I can only think of doing this with a method that
# goes over the whole list, maybe something smarter could work.
