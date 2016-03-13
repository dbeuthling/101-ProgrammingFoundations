require 'pry'

card_faces = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
card_suits = ['H', 'S', 'C', 'D']

def prompt(msg)
	puts "=> #{msg}"
end

def players_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	[rank[0] , rank[1]]

end


def hit(cards)
	cards.sample.values_at(1)
end


def dealer_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	[rank[0] , rank[1]]
end


def find_value(cards)
	sum = 0
  cards.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

	# sum = 0
	# cards.each do |card|
	# 	sum += VALUES.fetch(card)

   	cards.count("Ace").times do
    sum -= 10 if sum > 21
  end	
	sum
end

def busted?(hand)
	if hand > 21
		return true
	else
		return false
	end
end

loop do
  deck = card_suits.product(card_faces)
player_hand = players_cards(deck)
dealer_hand = dealer_cards(deck)
prompt("Dealer has a #{dealer_hand[0]} showing.")
prompt("You have: #{player_hand[0]} and #{player_hand[1]}")
prompt("For a total of #{find_value(player_hand)}")



answer = nil
loop do
  loop do
	break if busted?(find_value(player_hand))
  prompt("hit or stay?")
  answer = gets.chomp
  break if answer.downcase.start_with?('s') || busted?(find_value(player_hand))
  new_card = hit(deck)
  player_hand << new_card
  player_hand = player_hand.flatten!
  prompt("You drew a #{player_hand.last}")
  prompt("You now have a total of #{find_value(player_hand)}")


end

if busted?(find_value(player_hand))
  prompt("You busted!")
  break
else
  prompt("You chose to stay!")
end


prompt("Dealer has: #{dealer_hand[0]} and #{dealer_hand[1]}")
  if find_value(dealer_hand) < 17
    prompt("Dealer has #{find_value(dealer_hand)}")
		loop do 
		  prompt("Dealer must hit.")
		  new_card = hit(deck)
		  dealer_hand << new_card
		  dealer_hand = dealer_hand.flatten!
		  prompt("Dealer drew a #{dealer_hand.last}")
		  prompt("Dealer totals #{find_value(dealer_hand)}")
		  break if find_value(dealer_hand) > 16 || busted?(find_value(dealer_hand))
		end
  end
    prompt("You stayed with #{find_value(player_hand)}")
    if busted?(find_value(dealer_hand))
      prompt("Dealer busted, You win!")
      break
    else
      prompt("Dealer stays with #{find_value(dealer_hand)}")
      if find_value(dealer_hand) > find_value(player_hand)
        prompt("Dealer wins!")
        break
      elsif find_value(dealer_hand) == find_value(player_hand)
        prompt("Push")
        break
      else
        prompt("You win!")
        break
      end
    end
  end

  prompt("Would you like to play again? (y or n)")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
prompt("Thanks for playing!")  