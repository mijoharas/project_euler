tokenize = -> token {
  result = []
  case token[0]
  when /\d/
    result << token[0].to_i
  when 'J'
    result << :jack
  when 'Q'
    result << :queen
  when 'K'
    result << :king
  when 'A'
    result << :ace
  when 'T'
    result << 10
  else
    result << :error
  end

  case token[1]
  when 'H'
    result << :hearts
  when 'S'
    result << :spades
  when 'D'
    result << :diamonds
  when 'C'
    result << :clubs
  else
    result << :error
  end
  # p result
  result
}

get_hands = -> input_string {
  hands = input_string.split(/ /).map { |x| tokenize[x] }
  [hands[0..4], hands[5..hands.size] ]
}
value = {jack: 11, queen: 12, king: 13, ace: 14}

find_value = -> x {
  if x.class == Symbol
    value[x]
  else
    x
  end
}

is_straight = -> a {
  (1...a.size).map { |x| find_value[a[x]] == find_value[a[x-1]]-1 }.all?
}

straight_flush = -> a, b {
  if is_straight[a] && is_flush[a]
    if is_straight[b] && is_flush[b]
      if a.max { |x,y| find_value[x[0]]<=>find_value[y[0]]}
        true
      else
        false
      end
    else
      true
    end
  elsif is_straight[b] && is_flush[b]
    false
  else
    nil
  end
}

counter = ->(x) {x.inject(Hash.new(0)) { |acc, y| acc[y] += 1; acc }}
num_counter = -> x {counter[ x.map { |y| y[0] } ]}
suit_counter = -> x {counter[ x.map { |y| y[1] } ]}

get_ordered_multiples = -> x {  num_counter[x].to_a.sort { |a,b| [ b[1], b[0] ] <=> [ a[1], a[0]] } }

four_of_a_kind = -> a,b {
  a_hand = get_ordered_multiples[a]
  b_hand = get_ordered_multiples[b]
  if a_hand[0][1] == 4
    if b_hand[0][1] == 4
      if find_value[a_hand[0]] == find_value[b_hand[0]]
        find_value[a_hand[1]] <=> find_value[b_hand[1]]
      else
        find_value[a_hand[0]] <=> find_value[b_hand[0]]
      end
    else
      true
    end
  elsif b_hand[0][1] == 4
    false
  end
}

does_player_1_win = -> player_1, player_2 {
  result = [
            # straight_flush[player_1, player_2],
            four_of_a_kind[player_1, player_2],
            # full_house[player_1, player_2],
            # flush[player_1, player_2],
            # straight[player_1, player_2],
            # three_of_a_kind[player_1, player_2],
            # two_pair[player_1, player_2],
            # pair[player_1, player_2],
            # high[player_1, player_2]
           ]
    result.compact.map.take(1)
}

lines = File.open('poker.txt').map { |line|
  player_1, player_2 = get_hands[ line ]
  does_player_1_win[player_1, player_2]
}#.select { |x| x.include?(:error) }
