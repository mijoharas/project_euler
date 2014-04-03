require 'prime'
(-1000..1000).map {|a| (-1000..1000).map {|b| i=(0..Float::INFINITY).take_while {|n|(n**2+ a*n+b).prime?}.last; [i,b,a] }}.flatten(1).select{|x| x[0]!=nil}.max {|a,b| a[0] <=> b[0]}