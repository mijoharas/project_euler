digits = "123456789".split(//).map &:to_i
dig_map = digits.permutation.map {|x| x};
dig_map.each {|x|
 (0...9).each {|i|
  (i+1...9).each {|j| 
    if x[0...i].join.to_i*x[i...j].join.to_i==x[j..9].join.to_i
      set<<[x[0...i].join.to_i,x[i...j].join.to_i,x[j..9].join.to_i]
    end
  } } };

set.map {|x| x[2]}.uniq.reduce(:+)