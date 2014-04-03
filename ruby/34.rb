f=->(n){(1..n).reduce(:*)}
(1..9).each {|x| fac_hash[x]=f[x]}
fac_hash[0]=1
(3..2540160).select {|x| x.to_s.split(//).inject(0) {|acc,x|acc+=fac_hash[x.to_i]}==x }.reduce(:+)
