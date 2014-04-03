pentagonal = ->(n) {(n * ( 3 * n - 1)) / 2}
pentagonal_numbers = (1..10000).map { |n| pentagonal[n]}
# expand the qaudratic, if it has one integer root (hence the or) then true
# is_pentagonal = ->(x) {( ((0.5 + (0.25 + 6 * x)**0.5) / 3) % 1 == 0  ) || ( ((0.5 - (0.25 + 6 * x)**0.5) / 3) % 1 == 0  )}
is_pentagonal = ->(x) {( ((0.5 + (0.25 + 6 * x)**0.5) / 3) % 1 == 0  ) }
pair_is_pentagonal = ->(a,b) {is_pentagonal[a-b] && is_pentagonal[a+b]}
p pentagonal_numbers.each_with_index.flat_map { |x, n|
  (1..n).map { |i| [x, pentagonal_numbers[i]] }.select { |num| pair_is_pentagonal[*num] }
}
