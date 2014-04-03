is_palindrome = -> x {x == x.reverse}

isnt_lychrel = -> x {(0..50).inject([x, false]) { |acc, y|
    new_x =  acc[0].to_s.reverse.to_i + acc[0]
    # p new_x
    if !acc[1]
      if is_palindrome[new_x.to_s]
        acc[1] = true
        return acc
      else
        acc[0]=new_x
      end
    end
    acc
  }
}

(1..10000).map { |x| [x, isnt_lychrel[x][1] ] }.count { |x| !x[1] }
