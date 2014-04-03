# done but not looping over digit set like we should.
require 'prime'

digits = "1234567".split(//).map &:to_i
dig_map = digits.permutation.map {|x| x};
result = []
dig_map.each { |x|
    a = x[0..9].join.to_i
    if a.prime?
      result << a
    end
};
result.max
