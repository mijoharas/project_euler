require 'prime'
Prime.each.take_while {|x|x<1000000}.select {|x|
  !x.to_s.split(//).include?("0")}.select { |x|
    a=x.to_s.split(//)
    (a.length-1).times.inject([a.clone]) {|acc,x|
      b=acc[-1].clone
      y=b.shift
      b.push(y)
      acc<<b}.all? {|x|x.join.to_i.prime?}}.count