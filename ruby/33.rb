(10..99).flat_map {|a|
  (10..99).map {|b|
    [a,b] }}.select {|a,b| 
    b.to_s[1].to_i!=0 &&a.to_s[1]==b.to_s[0] && a<b}.select {|a,b| a.to_f/b.to_f==a.to_s[0].to_f/b.to_s[1].to_f}.inject(1) {|acc, (a,b)| 
    p [acc, a, b]; acc*=Rational(a,b) }.to_r