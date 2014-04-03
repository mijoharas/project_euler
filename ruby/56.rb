(1..100).flat_map { |a|
  (1..100).map { |b|
    (a**b).to_s.split(//).map(&:to_i).reduce(:+)
  }
}.max
