triangular = ->(n) {(n * (n + 1) / 2)}
pentagonal = ->(n) {(n * ( 3 * n - 1)) / 2}
hexagonal = ->(n) { (n * (2 * n - 1)) }
is_triangular = ->(x) {( - 0.5 + (0.25 + 2 * x)**0.5 ) % 1 == 0}
is_pentagonal = ->(x) {( ((0.5 + (0.25 + 6 * x)**0.5) / 3) % 1 == 0  ) }
is_hexagonal = ->(x) { (1 + (1 + 8 * x)**0.5) / 4 % 1 == 0}
(1..1000000).lazy.map { |i| hexagonal[i] }.filter { |x| is_pentagonal[x] && is_triangular[x] }.take(3)
