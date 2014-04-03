require "prime"

(1..Float::INFINITY).inject([ 1, 0, 1]) {
  |(diagonals, prime_diagonals, count), x|
  diagonals += 4
  prime_diagonals += (1..4).map { |y| count += 2 * x }.count(&:prime?)

  if prime_diagonals.to_f/(diagonals) < 0.10
    break [diagonals, prime_diagonals, ( 2 * x + 1 )]
  end

  # p [diagonals, prime_diagonals, count, prime_diagonals.to_f/diagonals]
  [diagonals, prime_diagonals, count]

}
