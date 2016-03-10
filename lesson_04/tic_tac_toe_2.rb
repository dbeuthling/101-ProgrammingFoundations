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

FIRST_PLAYER = ['player', 'computer'].freeze
COMPUTER_MARKER = 'O'.freeze
PLAYER_MARKER = 'X'.freeze
INITIAL_MARKER = ' '.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def prompt(msg)
  puts "=> #{msg}"
end


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
    prompt("Please pick an empty square (#{joinor(squares_empty?(brd))})")
    player_choice = gets.chomp.to_i
    break if squares_empty?(brd).include?(player_choice)
    prompt('That is not an option.')
  end
  brd[player_choice] = PLAYER_MARKER
end

def square_at_risk?(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
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

def board_full?(brd)
  if !brd.to_a.flatten.include?(INITIAL_MARKER)
    prompt("Tie Game.")
    return true
  end
end

def winner?(brd)
  !!find_winner(brd)
end

def find_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "Player"

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

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when 'computer'
    current_player = 'player'
  when 'player'
    current_player = 'computer'
  end
end

loop do
  computer_score = 0
  player_score = 0
  prompt('Welcome to Tic-Tac-Toe')
  prompt('First to 5 wins is the Champion')
  prompt('The squares are numbered 1 - 9. Like this:')
  numbered_board
  prompt('You will be X and the computer will be O')
  prompt('Do you want to go first? (y or n)')
  first = gets.chomp.downcase
  if first.start_with?('y')
    current_player = FIRST_PLAYER[0]
  else
    current_player = FIRST_PLAYER[1]
  end
  loop do
    board = initialize_board
    loop do
      display_board(board) if current_player == 'player'
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || board_full?(board)
    end

    if winner?(board)
      display_board(board)
      prompt("#{find_winner(board)} won!")
      computer_score += 1 if find_winner(board) == "Computer"
      player_score += 1 if find_winner(board) == "Player"
      prompt("The score is Computer: #{computer_score} You: #{player_score}")
      break if computer_score > 4 || player_score > 4
    end
  end

  display_board(board)
  prompt("The Champion is #{find_winner(board)}!")
  prompt('Do you want to play again?')
  again = gets.chomp.downcase
  break unless again.start_with?('y')
end

prompt('Thanks for playing!')