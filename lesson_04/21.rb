require 'pry'

full_deck = [['H', '2'], ['H', '3'],['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'Jack'],['H', 'Queen'], ['H', 'King'], ['H', 'Ace']] +
			[['S', '2'], ['S', '3'],['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'Jack'],['S', 'Queen'], ['S', 'King'], ['S', 'Ace']] +
			[['C', '2'], ['C', '3'],['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'Jack'],['C', 'Queen'], ['C', 'King'], ['C', 'Ace']] +
			[['D', '2'], ['D', '3'],['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'Jack'],['D', 'Queen'], ['D', 'King'], ['D', 'Ace']]

# VALUES = {"Ace"=>11, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "Jack"=>10, "Queen"=>10, "King"=>10}

deck = full_deck

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

# def dealer_starting_hand(deck)
# 	dealer_holding = dealer_cards(deck)
# 	prompt("Dealer has: #{dealer_holding[0]} and a hidden card.")
# 	find_value(dealer_holding)
# end



# def player_starting_hand(deck)
# 	player_holding = cards
# 	prompt("You have: #{player_holding[0]} and #{player_holding[1]}")
# 	prompt("For a total of #{find_value(player_holding)}")
# 	find_value(player_holding)
# end

def find_value(cards)
	sum = 0
  cards.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

 #  # correct for Aces
 #  cards.select { |value| value == "Ace" }.count.times do
 #    sum -= 10 if sum > 21
 #  end

 #  sum




	# sum = 0
	# cards.each do |card|
	# 	sum += VALUES.fetch(card)

   	cards.count("Ace").times do
    sum -= 10 if sum > 21
  end

# correct for Aces
  # cards.select { |value| value == "Ace" }.count.times do
  #   sum -= 10 if sum > 21
  # end

	
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
player_hand = players_cards(deck)
dealer_hand = dealer_cards(deck)
prompt("Dealer has: #{dealer_hand[0]} and a hidden card.")
prompt("You have: #{player_hand[0]} and #{player_hand[1]}")
prompt("For a total of #{find_value(player_hand)}")



answer = nil
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
prompt("busted")
else
  prompt("You chose to stay!")  # if player didn't bust, must have stayed to get here
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

  prompt("Would you like to play again? (y or n)")
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
	

  