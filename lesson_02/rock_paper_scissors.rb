VALID_CHOICES = %w(rock paper scissors).freeze

# def test_method(something)
#   prompt("#{something}")
# end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("YOU WIN! You chose #{player}, and the computer chose #{computer}.")
  elsif win?(computer, player)
    prompt("YOU LOST! You chose #{player}, and the computer chose #{computer}.")
  else prompt("TIE! You chose #{player}, and the computer chose #{computer}.")
  end
end
# p test_method('boofar')

def prompt(message)
  puts "=> #{message}"
end

choice = ''
computer_choice = ''

loop do
  loop do
    prompt("Please choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("Please pick a vaild choice. Check your spelling!")
  end

  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice)

  prompt("Would you like to play again?")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
prompt("Thanks for playing! Good-bye!")
