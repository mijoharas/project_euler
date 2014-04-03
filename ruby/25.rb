f=->(n,i=0,j=1){(1..n).each {i,j =j,i+j};i}
def func
  i,j=0,1
  (1..Float::INFINITY).each do |x|
    i,j =j,i+j
    if (i.to_s.length==1000)
      return x
    end
  end
end
func