require './cards'
require './deck'

@balance = 1000 #remove this when itegrating to main file

def new_game_twentyone
  fresh_deck = Deck.new
  @shuffled_deck = fresh_deck.shuffle_cards
  @count = 0
  @player_hand = []
  @dealer_hand = []
  @player_score = 0
  @dealer_score = 0
  @bet = 0

  puts "~=~=~=~=~= NEW GAME ~=~=~=~=~="
  puts "Place your bet!"
  puts "Your current balance is $#{@balance}"
  player_bet = gets.to_i

  if 
    player_bet > @balance
    new_game_twentyone
    puts "You can not bet more than your balance ($#{@balance})"
    puts "Enter r to return to the main menu"
    puts "Enter b to go to the balance menu"
    puts "Enter p to place a new bet"

    bet_menu_input = gets.strip
    if
      bet_menu_input == "r"
      main_menu
    elsif
      bet_menu_input == "b"
      balance_menu
    elsif
      bet_menu_input =="p"
      new_game_twentyone
    else
      puts "Invalid input - rerouting you to main menu."
      main_menu
    end
  else
    @bet = player_bet
    @balance -= player_bet
    puts ''
    puts "You bet $#{@bet}"

  end

  initial_deal_twentyone

end

def initial_deal_twentyone
  puts "The cards are dealt!"
  puts ''
  puts "You have the #{@shuffled_deck[-1].rank} of #{@shuffled_deck[-1].suit} and the #{@shuffled_deck[-2].rank} of #{@shuffled_deck[-2].suit}"
  @player_hand << @shuffled_deck[-1]
  @player_hand << @shuffled_deck[-2]
  player_hand_counter_twentyone(-1)
  player_hand_counter_twentyone(-2)
  puts "Your score is #{@player_score}"
  puts ''

  puts "The dealer shows #{@shuffled_deck[-3].rank} of #{@shuffled_deck[-3].suit} and has one card face down."
  puts ''
  @dealer_hand << @shuffled_deck[-3]
  @dealer_hand << @shuffled_deck[-4]
  dealer_hand_counter_twentyone(-3)
  dealer_hand_counter_twentyone(-4)

  player_twentyone

end

def player_hand_counter_twentyone(i)
  if 
    @shuffled_deck[i].rank == "A"
    @player_score += 11

  elsif
    @shuffled_deck[i].rank == "J" or 
    @shuffled_deck[i].rank == "Q" or 
    @shuffled_deck[i].rank == "K"
    @player_score += 10

  else
    @player_score += @shuffled_deck[i].rank.to_i

  end
end

def dealer_hand_counter_twentyone(i)
  if 
    @shuffled_deck[i].rank == "A"
    @dealer_score += 11

  elsif
    @shuffled_deck[i].rank == "J" or 
    @shuffled_deck[i].rank == "Q" or 
    @shuffled_deck[i].rank == "K"
    @dealer_score += 10

  else
    @dealer_score += @shuffled_deck[i].rank.to_i

  end
end

def draw_card_dealer_twentyone
  puts "The dealer draws the #{@shuffled_deck[@count].rank} of #{@shuffled_deck[@count].suit}."
  puts ''
  @dealer_hand << @shuffled_deck[@count]
  dealer_hand_counter_twentyone(@count)
  @count  += 1
  end

def player_twentyone
  puts "Enter d to draw, s to stand, h to view cards."
  input = gets.strip
  if input == "d"
    puts "You draw the #{@shuffled_deck[@count].rank} of #{@shuffled_deck[@count].suit}."
    # Push card into plater hand
    @player_hand << @shuffled_deck[@count]

    player_hand_counter_twentyone(@count)

    @count  += 1

    if @player_score == 21
      puts "You made 21!"
      winnings_twentyone
    elsif
      @player_score > 21
      bust_twentyone
    else
      player_twentyone
    end

  elsif
    input == "s"
    dealer_twentyone

  elsif
    input == "h"
    display_player_hand_twentyone
  else
    "Inavlid input"
    player_twentyone
  end
  puts ''
end

# How do I get it to print each card in the hand? some sort of for/each loop

def display_player_hand_twentyone
  puts "You are holding the following cards:"
  for player_card in @player_hand
    puts "#{player_card.rank} of #{player_card.suit} "
  end
  puts "Your current score is #{@player_score}"
  player_twentyone
end

def dealer_twentyone
  if @dealer_score >= 17
    count_scores_twentyone

  else
    draw_card_dealer_twentyone
    dealer_twentyone

  end
end

def bust_twentyone
  puts "You went over 21!"
  show_all_cards_twentyone
  one_more_game
end

def count_scores_twentyone
  show_all_cards_twentyone
  if @dealer_score > 21
    puts "The dealer busts!"
    winnings_twentyone

  elsif
    @player_score > @dealer_score
    puts "You win with a score of #{@player_score}! The dealer had a score of #{@dealer_score}."
    winnings_twentyone

  elsif @player_score == @dealer_score
    puts "You tied with the dealer. You get your bet of $#{@bet} back."
    @balance += @bet

  else
    puts "The dealer wins with a score of #{@dealer_score}, beating your score of #{@player_score}."
  end
  one_more_game
end

def winnings_twentyone
  @balance += (2 * @bet)
  puts "You win your bet of $#{@bet}, increasing your balance to $#{@balance}"
  one_more_game
end

def one_more_game
  puts "Play again? (y/n)"
  another_round = gets.strip
  if another_round == "y"
    puts ''
    new_game_twentyone
  else
    puts ''
    main_menu
  end
end

def show_all_cards_twentyone
  puts "Your hand was"
  for player_card in @player_hand
    puts "#{player_card.rank} of #{player_card.suit} "
  end
  puts "with a score of #{@player_score}."
  puts''

  puts "The dealer's hand was"
  for dealer_card in @dealer_hand
    puts "#{dealer_card.rank} of #{dealer_card.suit} "
  end
  puts "with a score of #{@dealer_score}."
  puts ''

end

new_game_twentyone
