# get our triangles
triangles = (1..30).map { |n| 0.5*n*(n+1) }

# then we get our words
words = File.open("words.txt").to_a.flat_map { |line| line.split(/,/)}.map { |word|
  num = word[1..-2].downcase.split(//).map { |char| char.ord - 96 }.reduce(:+)
  triangles.include?(num)
}.select { |x| x == true }.size
# and done
