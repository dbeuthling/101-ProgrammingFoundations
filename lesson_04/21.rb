require 'pry'

full_deck = [['H', '2'], ['H', '3'],['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'Jack'],['H', 'Queen'], ['H', 'King'], ['H', 'Ace']] +
			[['S', '2'], ['S', '3'],['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'Jack'],['S', 'Queen'], ['S', 'King'], ['S', 'Ace']] +
			[['C', '2'], ['C', '3'],['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'Jack'],['C', 'Queen'], ['C', 'King'], ['C', 'Ace']] +
			[['D', '2'], ['D', '3'],['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'Jack'],['D', 'Queen'], ['D', 'King'], ['D', 'Ace']]

VALUES = {"Ace"=>11, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "Jack"=>10, "Queen"=>10, "King"=>10}

deck = full_deck

def prompt(msg)
	puts "=> #{msg}"
end

def players_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	cards = [rank[0] , rank[1]]

end

def hit(cards)
	card = cards.sample.values_at(1)
	prompt("You drew a #{card.first}")
	find_value(card)
end


def dealer_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	cards = [rank[0] , rank[1]]
end

def dealer_starting_hand(deck)
	dealer_holding = dealer_cards(deck)
	prompt("Dealer has: #{dealer_holding[0]} and a hidden card.")
	find_value(dealer_holding)
end



def player_starting_hand(deck)
	player_holding = players_cards(deck)
	prompt("You have: #{player_holding[0]} and #{player_holding[1]}")
	prompt("For a total of #{find_value(player_holding)}")
	find_value(player_holding)
end

def find_value(cards)
	value=0
	cards.each do |card|
		value += VALUES.fetch(card)
		if card == 'Ace' && value > 21
			value -= 10
		end
	end
	value
end

def busted?(hand)
	if hand > 21
		return true
	else
		return false
	end
end

dealer_hand = dealer_starting_hand(deck)
player_hand = player_starting_hand(deck)
dealer_hand



answer = nil
loop do
	break if busted?(player_hand)
  prompt("hit or stay?")
  answer = gets.chomp
  break if answer == 'stay' || busted?(player_hand)   # the busted? method is not shown

  prompt("You now have a total of #{player_hand += hit(deck)}")


end

if busted?(player_hand)
prompt("busted")
else
  prompt("You chose to stay!")  # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn

