VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def expand_abbr(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("YOU WIN! You chose #{player}, and the computer chose #{computer}.")
  elsif win?(computer, player)
    prompt("YOU LOST! You chose #{player}, and the computer chose #{computer}.")
  else prompt("TIE! You chose #{player}, and the computer chose #{computer}.")
  end
end

def prompt(message)
  puts "=> #{message}"
end

player_choice = ''
computer_choice = ''
player_score = 0
computer_score = 0

prompt("First to 5 wins is Champion of the World!")
loop do
  loop do
    prompt("Please choose one (enter the letters inside the parenthesis):")
    prompt("(r)ock, (p)aper, (s)cissors, (l)izard, (sp)ock")
    player_choice = gets.chomp.downcase
    player_choice = expand_abbr(player_choice)
    break if VALID_CHOICES.include?(player_choice)
    prompt("Please pick a vaild player_choice. Check your spelling!")
  end

  computer_choice = VALID_CHOICES.sample
  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, player_choice)
    computer_score += 1
  end

  p "You have: #{player_score}, computer has: #{computer_score}"

  if player_score > 4 || computer_score > 4
    if player_score < computer_score
      prompt("The computer is the champ!")
    else
      prompt("You are the champ!")
    end
    player_score = 0
    computer_score = 0
    prompt("Would you like to play again?")
    again = gets.chomp
    break unless again.downcase.start_with?('y')
  end
end

prompt("Thanks for playing! Good-bye!")
