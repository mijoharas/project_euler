@set_1_9 = Set.new(1..9)

def is_pandigital(num)
  num.to_s.size==9 && num.to_s.split(//).map(&:to_i).to_set == @set_1_9
end

result = []

(1..99999).each do |num|
  n = (9.0/num.to_s.size).ceil
  (2..n).each do |n|
    if is_pandigital(a=(1..n).map {|times| (num * times).to_s }.join)
      result << a
    end
  end
end

result.max