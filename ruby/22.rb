sort_names = names.sort

def find_score(name)
  name.each_char.map {|char| char.ord - 64}.reduce(:+)
end

p sort_names.each_with_index.inject(0) {|acc, (name, index)|acc+=(1+index)*find_score(name)}