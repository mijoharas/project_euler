require "prime"

Prime.lazy.select do |x|
  (0...x.to_s.size).all? {|i| x.to_s[0..i].to_i.prime? && x.to_s[-i..-1].to_i.prime?}
end.drop(4).take(11).to_a.reduce(:+)