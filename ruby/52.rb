counter = ->(x) {x.inject(Hash.new(0)) { |acc, y| acc[y] += 1; acc }}

same_digits = ->(a,b) {
  counter[a.to_s.split(//)]== counter[b.to_s.split(//)]
}

# same_digits[101,110]
(1..1000000).lazy.select { |n|
  (1..6).lazy.map { |i|
    same_digits[i*n, n]
  }.all? }.take(1).force
