# Nice attempt
hash = {}
(1..1000).each { |a| hash[a]=0 }
(1..998).each { |a| 
(1...a).each { |b| 
  if (a+b) <1000
    c=(a**2+b**2).to_f**0.5
    if a+b+c<1000 && c%1==0 
      hash[(a+b+c).to_i]+=1
    end
  end
 } }
 hash.max_by {|k,v| v}

#also ugly first attempt, recorded so you can remember what the hell not to do
# Ugggh, this is horrible recorded here as a reminder of what not to do
# also takes too long to be practical
(3...p).inject([]) { |acc, c|
  (2...(p-c)).each {|b| acc <<Set.new([c,b,(p-c-b)]) unless b==(p-c-b)|| c==b||c==(p-b-c)};
  acc
}.uniq.select { |y|
  x=y.to_a
  (max = x.delete(x.max))
   p max; p x; p x[0]; p x[1];
    max**2==x[0]**2+x[1]**2}.uniq