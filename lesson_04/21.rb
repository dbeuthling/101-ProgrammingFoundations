FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].freeze
VALUES = ['H', 'S', 'C', 'D'].freeze
HIGH_HAND = 21
HITS_BELOW = 17
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
    sum -= 10 if sum > HIGH_HAND
  end
  sum
end

def busted?(hand)
  find_value(hand) > HIGH_HAND
end

def detect_result(dealer_hand, player_hand)
  player_total = find_value(player_hand)
  dealer_total = find_value(dealer_hand)
  if player_total > HIGH_HAND
    :player_busted
  elsif dealer_total > HIGH_HAND
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
  puts "========RESULT!========="
  case result
  when :player_busted
    prompt("You busted!")
  when :dealer_busted
    prompt("Dealer busted, you win!")
  when :player
    prompt("You win!")
    return "player"
  when :dealer
    prompt("Dealer wins!")
    return "dealer"
  when :push
    prompt("Push!")
  end
end

def play_again?
  prompt("Do you want to play again? (y or n)")
  again = gets.chomp
  again.downcase.start_with?('y')
end

def who_won(dealer_total, player_total)
  prompt("Dealer stays with #{dealer_total}") if dealer_total <= HIGH_HAND
  prompt("You stayed with #{player_total}") if player_total <= HIGH_HAND
end

loop do
  prompt("Welcome to 21!")
  prompt("First to five victories wins the championship!")
  player_wins = 0
  dealer_wins = 0
  loop do
    loop do
      prompt("Dealing cards...")
      deck = initialize_cards
      player_hand = deck.pop(2)
      dealer_hand = deck.pop(2)
      prompt("Dealer has a #{dealer_hand[0]} showing.")
      prompt("You have: #{player_hand[0]} and #{player_hand[1]}")
      prompt("For a total of #{find_value(player_hand)}")

      loop do
        hit_or_stay = nil
        loop do
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
        who_won(find_value(dealer_hand), find_value(player_hand))
        display_result(dealer_hand, player_hand)
        dealer_wins += 1
        break
      else
        prompt("You chose to stay!")
      end

      prompt("--------Dealer's Turn--------")
      prompt("Dealer has: #{dealer_hand[1]} and #{dealer_hand[0]}")
      loop do
        dealer_total = find_value(dealer_hand)
        break if dealer_total > HITS_BELOW
        prompt("Dealer has #{find_value(dealer_hand)}")
        prompt("-------Dealer must hit-------")
        dealer_hand << deck.pop
        prompt("Dealer drew a #{dealer_hand.last}")
      end

      dealer_total = find_value(dealer_hand)
      player_total = find_value(player_hand)

      if busted?(dealer_hand)
        prompt("Dealer has #{dealer_total}")
        who_won(dealer_total, player_total)
        display_result(dealer_hand, player_hand)
        player_wins += 1
        break
      end
      who_won(dealer_total, player_total)
      result = display_result(dealer_hand, player_hand)
      player_wins += 1 if result == "player"
      dealer_wins += 1 if result == "dealer"
      break if dealer_wins > 4 || player_wins > 4
      prompt("Player has #{player_wins} wins and Dealer has #{dealer_wins} wins.")
    end
    prompt("Player has #{player_wins} wins and Dealer has #{dealer_wins} wins.")
    break if dealer_wins > 4 || player_wins > 4
  end
  break unless play_again?
end
prompt("Thanks for playing!")
