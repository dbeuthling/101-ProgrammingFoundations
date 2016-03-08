require 'pry'

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
$first_mover = ''
$second_mover = ''
COMPUTER_MARKER = 'O'
PLAYER_MARKER = 'X'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

board = initialize_board

def joinor(nums, sep=", ", word="or")
  nums[-1] = "#{word} #{nums.last}" if nums.size > 1
  nums.join(sep)
end

def player_places_piece!(brd)
  player_choice = ''
  loop do
    puts "Please pick an empty square (#{joinor(squares_empty?(brd))})"
    player_choice = gets.chomp.to_i
    break if squares_empty?(brd).include?(player_choice)
    puts "That is not an option."
  end
  brd[player_choice] = PLAYER_MARKER
end

def square_at_risk?(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = square_at_risk?(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
    square = square_at_risk?(line, brd, PLAYER_MARKER)
    break if square
    end
  end

  if !square
    square = 5 if brd.values_at(5) == [INITIAL_MARKER]
  end

  if !square
    square = squares_empty?(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# def computer_block(brd)
#   WINNING_LINES.each do |line|
#       if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
#       puts "HERE!"
#       brd[line[0]] = COMPUTER_MARKER if brd[line[0]] == INITIAL_MARKER
#       brd[line[1]] = COMPUTER_MARKER if brd[line[1]] == INITIAL_MARKER
#       brd[line[2]] = COMPUTER_MARKER if brd[line[2]] == INITIAL_MARKER
#       return true
#       end
#     end

#   WINNING_LINES.each do |line|
#       if brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
#       puts "There!"
#       brd[line[0]] = COMPUTER_MARKER if brd[line[0]] == INITIAL_MARKER
#       brd[line[1]] = COMPUTER_MARKER if brd[line[1]] == INITIAL_MARKER
#       brd[line[2]] = COMPUTER_MARKER if brd[line[2]] == INITIAL_MARKER
#       return true
#     end
#   end
# end

# def computer_places_piece!(brd)
#   if computer_block(brd) != true
#   value = ''
#   loop do
#     random_computer_choice = brd.to_a.sample(1).to_h
#     random_computer_choice.each_value { |v| value = v }
#     if value != PLAYER_MARKER && value != COMPUTER_MARKER
#       computer_choice = random_computer_choice.key(INITIAL_MARKER)
#       brd[computer_choice.to_i] = COMPUTER_MARKER
#       break
#     end
#   end
# end
# end

def board_full?(brd)
  p "Cat's Game." if !brd.to_a.flatten.include?(INITIAL_MARKER)
end

def winner?(brd)
  !!find_winner(brd)
end

def find_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "You"

    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

def squares_empty?(brd)
  brd.keys.select { |choice| brd[choice] == INITIAL_MARKER }
end

FIRST_PLAYER = ["player", "computer"]


loop do
computer_score = 0
player_score = 0
  puts "Welcome to Tic-Tac-Toe"
  puts "First to 5 wins is the Champion"
  puts "The squares are numbered 1 - 9. Like this:"
  numbered_board
  puts "You will be X and the computer will be O"
    puts "Do you want to go first? (y or n)"
    first = gets.chomp.downcase
    first.start_with?('y') ? first_up = FIRST_PLAYER[0] : first_up = FIRST_PLAYER[1]
  loop do
    board = initialize_board


  case first_up
    when "player"
      loop do
        display_board(board)
        player_places_piece!(board)
        break if winner?(board) || board_full?(board)
        computer_places_piece!(board)
        break if winner?(board) || board_full?(board)
      end
    when "computer"
      loop do
        computer_places_piece!(board)
        display_board(board)
        break if winner?(board) || board_full?(board)
        player_places_piece!(board)
        break if winner?(board) || board_full?(board)
      end
    end

    if winner?(board)
      display_board(board)
      puts "#{find_winner(board)} won!"
      computer_score += 1 if find_winner(board) == "Computer"
      player_score += 1 if find_winner(board) == "You"
      puts "The score is Computer: #{computer_score} You: #{player_score}"
      break if computer_score > 4 || player_score > 4
    end
  end


    display_board(board)
    puts "The Champion is #{find_winner(board)}!"
    puts "Do you want to play again?"
    again = gets.chomp.downcase
    break unless again.start_with?('y')
end



puts "Thanks for playing!"
