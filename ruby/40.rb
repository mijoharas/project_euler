# we have a function that finds what digit is in the 10- 100 etc. position, up
# exponent of 10

find_nums = ->(n) {
  nums = (0..n).map { |x| 10**x }

  string = ('1'..('1'+'0'*n)).to_a.join('')
  nums.map { |num| string[num-1]}.map(&:to_i).reduce(:*)

  }
find_nums[6]
