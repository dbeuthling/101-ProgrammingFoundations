require 'pry'



card_values = {"A"=>[1, 11], "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "J"=>10, "Q"=>10, "K"=>10}

def four_of_each(cards)
	deck={}
	cards.each_key { |card| deck[card] = 4 }
	deck
end

full_deck = four_of_each(card_values)

players_cards = card_values.to_a.sample(2).to_h # doesn't allow for pairs
dealers_cards = card_values.to_a.sample(2).to_h # doesn't allow for pairs

def player_value(cards)
	sum = 0
	cards.each_pair do |card, value| 
		if card.include?("A")
			sum = 11 + value
		else
			sum += value
		end
	end
	sum
end

p players_cards
p player_value(players_cards)

