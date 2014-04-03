require 'prime'

def total_of_factors(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end.reject {|a| a==number}.reduce(:+)
end

factor_hash ={}
(2..10000).each {|x| factor_hash[x]=total_of_factors(x)}


total = factor_hash.each.select {|a,b| a!=b && a==factor_hash[factor_hash[a]]}.transpose[0].reduce(:+)
