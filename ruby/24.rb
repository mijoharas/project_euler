def permutations array
  return enum_for(__method__, array) unless block_given?
  if array.size < 2
    yield array
  else
    array.each do |element|
      permutations(array.select() {|n| n != element}) \
      {|val| yield([element].concat val)}
    end
  end
end

a =permutations((0..9).to_a).lazy.drop(999999).take(1).force
p a[0].join

# Jesus christ this is clever.
class Integer
  def factorial
    return 1 if self == 0
    (1..self).inject(1,:*)
  end
end
 
def solver
  seed = "0123456789"
  sofar = ""
  nth = 999999
  (0..9).each do |i|
    f=(9-i).factorial
    puts f
    n=nth/f
    puts n
    sofar += seed[n]
    puts sofar
    nth -= f*n
    puts nth
    seed = seed.delete(seed[n])
    puts seed
  end
  puts sofar
end
 
timer_start = Time.now
solver
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"
puts 999999.factorial