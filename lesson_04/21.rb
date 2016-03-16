require 'rubocop'
card_faces = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
card_suits = ['H', 'S', 'C', 'D']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_cards(suits, faces)
  faces.product(suits).shuffle
end

def players_cards(deck)
  deck.pop(2)
end

def hit(cards)
  cards.pop
end

def dealer_cards(deck)
  deck.pop(2)
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
  hand > 21
end

loop do # play again?
  deck = initialize_cards(card_suits, card_faces)
  player_hand = players_cards(deck)
  dealer_hand = dealer_cards(deck)
  prompt("Dealer has a #{dealer_hand[0]} showing.")
  prompt("You have: #{player_hand[0]} and #{player_hand[1]}")
  prompt("For a total of #{find_value(player_hand)}")

  hit_or_stay = nil
  loop do # game loop
    loop do # player turns
      break if busted?(find_value(player_hand))
      loop do # hit or stay
        prompt("Do you (h)it or (s)tay?")
        hit_or_stay = gets.chomp
        break if ['h', 's'].include?(hit_or_stay)
        prompt("You must enter an h or s!")
      end
      break if hit_or_stay.downcase.start_with?('s') || busted?(find_value(player_hand))
      new_card = hit(deck)
      player_hand << new_card
      prompt("You drew a #{player_hand.last}")
      prompt("You now have a total of #{find_value(player_hand)}")
    end

    if busted?(find_value(player_hand))
      prompt("You busted!")
      break
    else
      prompt("You chose to stay!")
    end

    prompt("--------Dealer's Turn--------")
    prompt("Dealer has: #{dealer_hand[1]} and #{dealer_hand[0]}")
    if find_value(dealer_hand) < 17
      prompt("Dealer has #{find_value(dealer_hand)}")
      loop do
        prompt("-------Dealer must hit-------")
        new_card = hit(deck)
        dealer_hand << new_card
        prompt("Dealer drew a #{dealer_hand.last}")
        prompt("Dealer totals #{find_value(dealer_hand)}")
        break if find_value(dealer_hand) > 16 || busted?(find_value(dealer_hand))
      end
    end
    prompt("You stayed with #{find_value(player_hand)}")
    if busted?(find_value(dealer_hand))
      prompt("Dealer busted, You win!")
    else
      prompt("Dealer stays with #{find_value(dealer_hand)}")
      if find_value(dealer_hand) > find_value(player_hand)
        prompt("Dealer wins!")
      elsif find_value(dealer_hand) == find_value(player_hand)
        prompt("Push")
      else
        prompt("You win!")
      end
    end
    break
  end

  prompt("Would you like to play again? (y or n)")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
prompt("Thanks for playing!")
