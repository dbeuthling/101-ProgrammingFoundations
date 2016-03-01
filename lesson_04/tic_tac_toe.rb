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

def valid_choice?(choice)
  choice.match /^([1-9])$/
end

puts "Welcome to Tic-Tac-Toe"
puts "The squares are numbered 1 - 9. Like this:"
numbered_board
puts "You will be X and the computer will be O"
loop do
  puts "Please pick a square"
  player_choice = gets.chomp
  if valid_choice?(player_choice) != nil
    break
  else puts "You need to pick a number between 1 and 9."
  end
end




