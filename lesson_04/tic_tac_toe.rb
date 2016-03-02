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
  (1..9).each { |num| new_board[num] = ' '}
  new_board
end

board = initialize_board
display_board(board)

def player_places_piece(brd)
  player_choice = ''
  loop do
    puts "Please pick an empty square (1-9)"
    player_choice = gets.chomp.to_s
    if ((player_choice.match /^([1-9])$/) && (brd[player_choice.to_i] == ' '))
      break
    end
  end
  brd[player_choice.to_i] = 'X'
end

def computer_places_piece(brd)
  value = ''
  loop do
    random_computer_choice = brd.to_a.sample(1).to_h
    random_computer_choice.each_value { |value| value = value }
    if value != 'X' then
      computer_choice = random_computer_choice.key(' ')
      brd[computer_choice] = 'O'
      p computer_choice
      break
    end
  end
end

def valid_choice?(choice)
  choice.match /^([1-9])$/
end

puts "Welcome to Tic-Tac-Toe"
puts "The squares are numbered 1 - 9. Like this:"
numbered_board
puts "You will be X and the computer will be O"


player_places_piece(board)
display_board(board)
computer_places_piece(board)
display_board(board)
