require 'prime'
def find_stuff
  (1..Float::INFINITY).lazy.each do |num|
      triangle = (1..num).each.reduce(:+)
      factors = triangle.prime_division.inject(1) {|acc,x| acc*=(x[1]+1)}
      if (factors>500)
        return triangle
    end
  end
end
find_stuff