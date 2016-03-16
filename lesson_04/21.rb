# require 'rubocop'
FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].freeze
VALUES = ['H', 'S', 'C', 'D'].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_cards
  FACES.product(VALUES).shuffle
end

def find_value(cards)
  sum = 0
  rank = cards.collect { |card| card[0] }
  rank.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  rank.count("Ace").times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(hand)
  find_value(hand) > 21
end

def detect_result(dealer_hand, player_hand)
  player_total = find_value(player_hand)
  dealer_total = find_value(dealer_hand)
  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :push
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt("You busted!")
  when :dealer_busted
    prompt("Dealer busted, you win!")
  when :player
    prompt("You win!")
  when :dealer
    prompt("Dealer wins!")
  when :push
    prompt("Push!")
  end
end

def play_again?
  prompt("Do you want to play again? (y or n)")
  again = gets.chomp
  again.downcase.start_with?('y')
end

loop do
  prompt("Welcome to 21! Dealing cards...")
  deck = initialize_cards
  player_hand = deck.pop(2)
  dealer_hand = deck.pop(2)
  prompt("Dealer has a #{dealer_hand[0]} showing.")
  prompt("You have: #{player_hand[0]} and #{player_hand[1]}")
  prompt("For a total of #{find_value(player_hand)}")

  loop do # player
    hit_or_stay = nil
    loop do # hit or stay
      prompt("Do you (h)it or (s)tay?")
      hit_or_stay = gets.chomp
      break if ['h', 's'].include?(hit_or_stay)
      prompt("You must enter an h or s!")
    end
    break if hit_or_stay.downcase.start_with?('s')
    player_hand << deck.pop
    prompt("You drew a #{player_hand.last}")
    prompt("You now have a total of #{find_value(player_hand)}")
    break if busted?(player_hand)
  end

  if busted?(player_hand)
    display_result(dealer_hand, player_hand)
    play_again? ? next : break
  else
    prompt("You chose to stay!")
  end

  prompt("--------Dealer's Turn--------")
  prompt("Dealer has: #{dealer_hand[1]} and #{dealer_hand[0]}")
  loop do
    break if busted?(dealer_hand) || find_value(dealer_hand) > 16
    prompt("Dealer has #{find_value(dealer_hand)}")
    prompt("-------Dealer must hit-------")
    dealer_hand << deck.pop
    prompt("Dealer drew a #{dealer_hand.last}")
  end

  if busted?(dealer_hand)
    prompt("Dealer has #{find_value(dealer_hand)}")
    display_result(dealer_hand, player_hand)
    play_again? ? next : break
  end
  prompt("You stayed with #{find_value(player_hand)}")
  prompt("Dealer stays with #{find_value(dealer_hand)}")
  display_result(dealer_hand, player_hand)
  break unless play_again?
end
prompt("Thanks for playing!")
