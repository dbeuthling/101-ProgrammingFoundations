VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

# def test_method(something)
#   prompt("#{something}")
# end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def expand_abbr(letter)
  case letter
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

$player_score = 0
$computer_score = 0


def display_results(player, computer)
  if win?(player, computer)
    $player_score += 1
    # if $computer_score > 0 then $computer_score -=1 end
    prompt("YOU WIN! You chose #{player}, and the computer chose #{computer}.")
  elsif win?(computer, player)
    $computer_score += 1
    # if $player_score > 0 then $player_score -=1 end
    prompt("YOU LOST! You chose #{player}, and the computer chose #{computer}.")
  else prompt("TIE! You chose #{player}, and the computer chose #{computer}.")
  end
  #prompt("Score is: Computer - #{computer_score}  You - #{player_score}")
end
# p test_method('boofar')

def prompt(message)
  puts "=> #{message}"
end

choice = ''
computer_choice = ''

loop do
  loop do
    prompt("Please choose one (enter the letters inside the parenthesis): (r)ock, (p)aper, (s)cissors, (l)izard, (sp)ock")
    choice = gets.chomp.downcase
    choice = expand_abbr(choice)
    break if VALID_CHOICES.include?(choice)
    prompt("Please pick a vaild choice. Check your spelling!")
  end

  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice)
p "You #{$player_score}, computer: #{$computer_score}"

  prompt("Would you like to play again?")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
prompt("Thanks for playing! Good-bye!")
