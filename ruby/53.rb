require 'benchmark'

factorial = -> n {
  (1..n).inject(:*) || 1
}

other_fact = -> n {
  if n==0
    1
  else
    (1..n).reduce(:*)
  end
}

n = 10000
Benchmark.bm do |x|
  x.report {n.times do
      factorial[n]
    end}
  x.report {n.times do other_fact[n]
    end}
end

ncr = -> (n,r) {
  factorial[n]/(factorial[r]*(factorial[n - r]))
}
(1..100).flat_map { |n|
  (1...n).map { |r|
    ncr[n,r]
  }
}.select { |x| x > 1000000 }.count
