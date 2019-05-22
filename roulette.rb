@balance = 1000 #remove this when integrating to main file

def roulette_bet
  @bet = 0
@bet_odds = 1
  puts "~=~=~=~=~= NEW GAME ~=~=~=~=~="
  puts "Place your bet!"
  puts "Your current balance is $#{@balance}"
  player_bet = gets.to_i
  @bet = player_bet
  @balance -= player_bet
  puts "You bet $#{@bet}"

  roulette_menu

end

def roulette_menu

  puts "How will you bet?"
  puts "1. Single number"
  puts "2. Even or Odd"
  puts "3. High/Low"
  player_input = gets.to_i

  if
    player_input == 1
    single_number_roulette

  elsif
    player_input == 2
    even_odd_roulette

  elsif
    player_input == 3
    low_high_roulette

  else
    puts "Invalid input - try again"
    roulette_menu

  end

end

def single_number_roulette
  puts "What number do you think the wheel will land on? (1 - 36)"
  @player_guess_roulette = gets.to_i
  if @player_guess_roulette > 36 or @player_guess_roulette < 1
    puts "Choose a whole number between 1 and 36."
    single_number_roulette
  else
    puts "You guess #{@player_guess_roulette}"
  end

  spin_wheel_roulette
  @bet_odds = 35
 
  if @roulette_ball == @player_guess_roulette
    winnings = (@bet_odds * @bet)
    puts "The ball landed on #{@roulette_ball}, you win $#{winnings}!"
    @balance += winnings
    puts winnings
    puts @balance

  else
    puts "The ball landed on #{@roulette_ball}, you lose this time."
  end

  play_roulette_again

end

def even_odd_roulette
  puts "Where will the ball land, even or odd?"
  @player_guess_roulette = gets.strip
  if @player_guess_roulette == "even"
    puts "You guess even."
    even_odd = 0
  elsif
    @player_guess_roulette == "odd"
    puts "You guess odd."
    even_odd = 1
  else
    puts "Invalid input - enter 'even' or 'odd' (no quotes)."
    even_odd_roulette
  end
  
  spin_wheel_roulette
  @bet_odds = 2

  if @roulette_ball % 2 == even_odd
    winnings = (@bet_odds * @bet)
    puts "The ball landed on #{@roulette_ball}, an #{@player_guess_roulette} number. You win $#{winnings}!"
    @balance += winnings

  else
    puts "The ball landed on #{@roulette_ball}, you lose this time."
  end
  
  play_roulette_again
  
end

def low_high_roulette
  puts "Where will the ball land, high or low?"
  @player_guess_roulette = gets.strip
  if @player_guess_roulette == "high"
    puts "You guess high."
    high_low_guess = 1
  elsif
    @player_guess_roulette == "low"
    puts "You guess low."
    even_odd_guess = 0
  else
    puts "Invalid input - enter 'high' or 'low' (no quotes)."
    low_high_roulette
  end
  
  spin_wheel_roulette
  @bet_odds = 2
  winnings = (@bet_odds * @bet)

  if @roulette_ball > 18
    high_low_actual = 1

  else
    high_low_actual = 0

  end

  if high_low_guess == high_low_actual
    puts "The ball landed on #{@roulette_ball}, your guess of #{@player_guess_roulette} was correct! You win #{winnings}"
    @balance += winnings
  else
    puts "The ball landed on #{@roulette_ball}, your guess of #{@player_guess_roulette} was incorrect. Better luck next time!"
  end
  
  play_roulette_again

end

def spin_wheel_roulette
@roulette_ball = (1 + rand(36))
end

def play_roulette_again
  puts "Do you want to play more roulette? (y/n)"
  another_round = gets.strip
  if another_round == "y"
    roulette_bet
  else
    main_menu
  end
end

roulette_bet