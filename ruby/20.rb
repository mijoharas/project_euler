(1..n).reduce(:*).to_s.split(//).map(&:to_i).reduce(:+)