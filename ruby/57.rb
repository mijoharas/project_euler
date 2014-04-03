numerator = 3
denominator = 2
(2..1000).map { |n|
  numerator, denominator = numerator + 2*denominator, denominator +  numerator
  # p [ numerator, denominator, numerator> denominator]
  numerator.to_s.size > denominator.to_s.size
}.count { |x| x }
