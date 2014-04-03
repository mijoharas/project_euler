five_hash = {}
(0..9).each {|x| five_hash[x]=x**5}
max=(1..1.0/0).find {|x|acc=0; (1..x).each {|y| acc+=9*10**y}; acc> x*9**5} * 9**5
(2..max).select {|x| x.to_s.split(//).inject(0) {|acc,y|acc+=five_hash[y.to_i]}==x }.reduce(:+)
# 443839