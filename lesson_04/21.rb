full_deck = [['H', '2'], ['H', '3'],['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],['H', 'Q'], ['H', 'K'], ['H', 'A']] +
			[['S', '2'], ['S', '3'],['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'],['S', 'Q'], ['S', 'K'], ['S', 'A']] +
			[['C', '2'], ['C', '3'],['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'],['C', 'Q'], ['C', 'K'], ['C', 'A']] +
			[['D', '2'], ['D', '3'],['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'],['D', 'Q'], ['D', 'K'], ['D', 'A']]

values = {"A"=>[1, 11], "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "J"=>10, "Q"=>10, "K"=>10}


def players_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	rank[0] + " and " + rank[1]
end

def dealer_cards(deck)
	hand = deck.sample(2)
	rank = hand.collect {|card| card[1] }
	rank[0] + " and a hidden card"
end

puts "You have #{players_cards(full_deck)}."
puts "Dealer has #{dealer_cards(full_deck)}."




# cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
# suits = %w(S D C H)

# p cards.combination(2).to_a.sample(1)

# def combine(suit, card)
# 	deck = []
# 	suit.each do |suit|
# 		card.each do |card|
# 			deck << [suit] 
# 			deck << [card]
# 		end
# 	end
# 	suit

# 	end
# p combine(suits, cards)
# p full_deck