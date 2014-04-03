set =Set.new;(2..100).each {|a| acc=a;(2..100).each {|b|acc*=a; set<<acc}};set.count
# 9183