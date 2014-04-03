def prime_proof?(x)
  ('1'..'9').all? {|num| y=x.to_s.clone; y[0]=num;!y.to_i.prime? } && (1...x.to_s.length).all? { |e|
   ('0'..'9').all? {|num| y=x.to_s.clone; y[e]=num;!y.to_i.prime? } }
end

def squby_gen_gen
  Prime.lazy.flat_map { |p| p_squared=p**2;p_cubed=p**3;
  Prime.lazy.take_while {|q| q<p}.flat_map {|q| 
    [p_squared*q**3,p_cubed*q**2]}
  }
end

squby_gen_gen.select {|x| x.to_s =~ /200/ && prime_proof?(x)}.take(5).force
squby_gen_gen.select {|x| x.to_s =~ /200/}.take(2).force