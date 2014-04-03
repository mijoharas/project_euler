(1..500).inject([1,0,1]) {|acc,x|acc[1]+=2;4.times { acc[0]+=acc[1];acc[2]+=acc[0];};acc }[2]
# 669171001