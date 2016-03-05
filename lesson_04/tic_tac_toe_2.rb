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

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

board = initialize_board

def squares_empty?(brd)
  brd.keys.select { |choice| brd[choice] == ' ' }
end

def player_places_piece!(brd)
  player_choice = ''
  loop do
    puts "Please pick an empty square (#{squares_empty?(brd).join(', ')})"
    player_choice = gets.chomp.to_i
    break if squares_empty?(brd).include?(player_choice)
    puts "That is not an option."
  end
  brd[player_choice] = 'X'
end

def computer_places_piece!(brd)
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
  !!find_winner(brd)
end

def find_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if brd[line[0]] == 'X' &&
       brd[line[1]] == 'X' &&
       brd[line[2]] == 'X'
      return "You"
    elsif brd[line[0]] == 'O' &&
          brd[line[1]] == 'O' &&
          brd[line[2]] == 'O'
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board
  puts "Welcome to Tic-Tac-Toe"
  puts "The squares are numbered 1 - 9. Like this:"
  numbered_board
  puts "You will be X and the computer will be O"
  loop do
    player_places_piece!(board)
    break if winner?(board) || board_full?(board)
    computer_places_piece!(board)
    break if winner?(board) || board_full?(board)
    display_board(board)
  end

if winner?(board)
  puts "#{find_winner(board)} won!"
end

  display_board(board)
  puts "Do you want to play again?"
  again = gets.chomp.downcase
  break unless again.start_with?('y')
end

puts "Thanks for playing!"
