# substring divisibility by prime numbers for 0 to 9 pandigitals

digits = "0123456789".split(//).map &:to_i
dig_map = digits.permutation.map {|x| x};
# test = ["1406357289".split(//).map( &:to_i) ]

ans = dig_map.select { |num|
   (num[7..9].join.to_i % 17 == 0) && (num[6..8].join.to_i % 13 == 0) && \
  (num[5..7].join.to_i % 11 == 0) && (num[4..6].join.to_i % 7 == 0) &&
  (num[3..5].join.to_i % 5 == 0) && (num[2..4].join.to_i % 3 == 0) && (num[1..3].join.to_i % 2 == 0)
}.map { |num| num.join.to_i }.reduce(:+)

p ans
