# will not work for cycles that don't start ot position 0
require 'prime'
Prime.lazy.take_while {|i| i<1000}.map { |x| [(1..x).detect(Proc.new{0}) { |y| (10**y % x) == 1 }, x] }.each.force.max