# we could be smart and think about our degrees of freedom and go that way,
# but lets think about order, we're looking at six 4 digit numbers so
# lets call it 9000**6 which sounds like numbers I don't wanna deal with, lets
# look at the number of triangular numbers in the set 96, seems pretty easy to work with.
triangular = -> n {(n * (n + 1) / 2)}
square = -> n {n*n}
pentagonal = -> n {(3 * n - 1) / 2}
hexagonal = -> n { n * (2 * n - 1)}
heptagonal = -> n {( n * (5 * n - 3) ) / 2}
octogonal = -> n { n * (3 * n - 2) }
get_nums = -> (proc) { (1...Float::INFINITY).lazy.map { |x| proc.call(x) }.drop_while { |x| x < 1000 }.take_while { |x| x < 10000 }.force }

proc_arrays = [triangular, square, pentagonal, hexagonal, heptagonal, octogonal]

num_arrays = proc_arrays.map { |x| get_nums[x] }

numbers_follow = -> a,b {a.to_s[2..3] == b.to_s[0..1]}

our_funky_func = -> arr, index, number {
  arr[index].select { |x| numbers_follow[number, x] }.select { |x|
    (index == arr.size - 1)? arr.size : our_funky_func[arr, index + 1, x]; }

}

num_arrays[0].map { |x| our_funky_func[num_arrays,1, x] }
# numbers_follow[1122, 2233]
# numbers_follow[2233, 1122]
