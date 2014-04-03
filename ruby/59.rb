numbers = File.open('cipher1.txt').flat_map { |line|
  numbers = line.split(/\,/).map(&:to_i)
}
list_a = []
list_b = []
list_c = []
numbers.each_slice(3) { |a,b,c|
  list_a << a
  list_b << b
  list_c << c
}
is_in_table = -> char {
  case(char)
  when (32..126)
    true
  else
    false
  end
}
counter = ->(x) {x.inject(Hash.new(0)) { |acc, y| acc[y] += 1; acc }.sort { |a,b| b[1] <=> a[1] }}

# this code is a remnant from when I thought there was no punctuation in the sample text
# check_encryption = -> list, check_value {list.map { |char| is_in_table[char ^ check_value] }}
# (97..122).select { |num| check_encryption[list_a.uniq, num] }

code = [
counter[list_a].first.first ^ 32,
counter[list_b].first.first ^ 32,
counter[list_c].first.first ^ 32
]#.map(&:chr).join('')

answer = numbers.each_slice(3).inject(0) { |acc, (a,b,c)|
  # p [acc, a, b, c]
  acc += a ^ code[0] if a
  acc += b ^ code[1] if b
  acc += c ^ code[2] if c
  acc
}
