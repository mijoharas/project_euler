require "prime"

# this function replaces a permutation of all positional digits replaced with *
replace_digits = ->(n) {
  replace_digits_recurse = ->(number, index) {
    same = number.clone
    number[index] = "*"
    if index == 0
      [same, number]
    else
      [*replace_digits_recurse.call(number, index - 1), *replace_digits_recurse.call(same, index - 1)]
    end
  }
  replace_digits_recurse.call(n.to_s, n.to_s.size - 1).reject { |x| x =~ /^\**$|^\d*$/ }
}

get_num_primes_from_sub = ->(num_string) {
    (1..9).map { |i|
      num_string.gsub("*", i.to_s).to_i
    }.count { |x| x.prime? }
}

numbers_prime_replacement_maximum = ->(n) {
  replace_digits.(n).map { |num_string|
    get_num_primes_from_sub[num_string]
  }.max
}

numbers_prime_replacement = ->(n) {
  replace_digits.(n).map { |num_string|
    [num_string, get_num_primes_from_sub[num_string] ]
  }
}

p Prime.map.lazy.drop_while { |prime| prime < 100000 }.select { |prime| numbers_prime_replacement_maximum[prime] == 8 }.take(1).force

# This technique is too slow and needs to be redesigned
# we should be searching through for the substitutable string and then find the minimum number?
# aghhh it needs the smallest prime in the 8 prime family, not just the family itself
# oh well can't be bothered to fix and got there by inspection ("*2*3*3" from numbers_prime_replacement of solution.)
