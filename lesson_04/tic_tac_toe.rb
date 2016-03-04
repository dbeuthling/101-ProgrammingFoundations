def numbered_board
  puts "     |     |"
  puts "  1  |  2  |  3"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  4  |  5  |  6"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  7  |  8  |  9"
  puts "     |     |"
end

def display_board(brd)
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def player_places_piece(brd)
  player_choice = ''
  loop do
    puts "Please pick an empty square (1-9)"
    player_choice = gets.chomp.to_s
    if (player_choice.match /^([1-9])$/) && (brd[player_choice.to_i] == ' ')
      break
    end
  end
  brd[player_choice.to_i] = 'X'
end

def computer_places_piece(brd)
  value = ''
  loop do
    random_computer_choice = brd.to_a.sample(1).to_h
    random_computer_choice.each_value { |v| value = v }
    if value != 'X' && value != 'O'
      computer_choice = random_computer_choice.key(' ')
      brd[computer_choice.to_i] = 'O'
      break
    end
  end
end

def board_full?(brd)
  p "Cat's Game." if !brd.to_a.flatten.include?(' ')
end

def winner?(brd)
  if brd.values_at(1, 2, 3) == ['X', 'X', 'X'] ||
     brd.values_at(4, 5, 6) == ['X', 'X', 'X'] ||
     brd.values_at(7, 8, 9) == ['X', 'X', 'X'] ||
     brd.values_at(1, 4, 7) == ['X', 'X', 'X'] ||
     brd.values_at(2, 5, 8) == ['X', 'X', 'X'] ||
     brd.values_at(3, 6, 9) == ['X', 'X', 'X'] ||
     brd.values_at(1, 5, 9) == ['X', 'X', 'X'] ||
     brd.values_at(3, 5, 7) == ['X', 'X', 'X']
    p "You win!"
  elsif brd.values_at(1, 2, 3) == ['O', 'O', 'O'] ||
        brd.values_at(4, 5, 6) == ['O', 'O', 'O'] ||
        brd.values_at(7, 8, 9) == ['O', 'O', 'O'] ||
        brd.values_at(1, 4, 7) == ['O', 'O', 'O'] ||
        brd.values_at(2, 5, 8) == ['O', 'O', 'O'] ||
        brd.values_at(3, 6, 9) == ['O', 'O', 'O'] ||
        brd.values_at(1, 5, 9) == ['O', 'O', 'O'] ||
        brd.values_at(3, 5, 7) == ['O', 'O', 'O']
    p "Computer wins!"
  end
end

loop do
  board = initialize_board
  puts "Welcome to Tic-Tac-Toe"
  puts "The squares are numbered 1 - 9. Like this:"
  numbered_board
  puts "You will be X and the computer will be O"

  loop do
    player_places_piece(board)
    break if winner?(board) || board_full?(board)
    computer_places_piece(board)
    break if winner?(board) || board_full?(board)
    display_board(board)
  end

  display_board(board)
  puts "Do you want to play again?"
  again = gets.chomp.downcase
  break unless again.start_with?('y')
end

puts "Thanks for playing!"
