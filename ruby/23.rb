#needs optimisation, untested
require "prime"

def total_of_factors(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end.reject {|a| a==number}.reduce(:+)
end

factor_hash ={1 => 1}
(2..28123).each {|x| factor_hash[x]=total_of_factors(x)}

abundant_list=[]
factor_hash.each {|k,v| if (k<v); abundant_list << k ;end}
factor_of_2_abundants = abundant_list.combination(2).map {|x| x.reduce(:+)}

#this takes too long, we're building a list that's large
# and checking membership on each element, optimise with
# binary tree, etc.
ans_list = []
(1..28123).each do |x|
sums = abundant_list.take_while {|y| y<x}
sums.each { |y|
 if sums.include?(x-y)
  ans_list << x
  break
 end
}
end

(1..28123).each.inject {|acc,x| acc+=(ans_list.include?(x))? 0:x;}
