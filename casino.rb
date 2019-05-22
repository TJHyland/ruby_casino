require './cards'
require './deck'

@balance = 0

def main_menu
  puts "~=~=~=~=~= DPL CASINO =~=~=~=~=~ "
  puts "1.) Play"
  puts "2.) Balance"
  puts "3.) Cashout"
  puts "~=~=~=~ Select an option ~=~=~=~ "

  main_choice = gets.strip
  if 
    main_choice == "1"
    game_menu

  elsif
    main_choice == "2"
    balance_menu

  elsif
    main_choice == "3"
    cashout_menu

  else
    puts "Invalid input - to play games, enter '1' with no quotations"
    main_menu

  end

end

def game_menu
  puts "~=~=~=~=~= PLAY GAME =~=~=~=~=~ "
  puts "1.) 21"
  puts "2.) High/Low"
  puts "3.) Roulette"
  puts "4.) Main menu"
  puts "~=~=~=~ $$ WIN MONEY $$ ~=~=~=~ "

  game_choice = gets.strip
  if 
    game_choice == "1"
    twentyone_game

  elsif
    game_choice == "2"
    highlow_game

  elsif
    game_choice == "3"
    roulette_game

  elsif
    game_choice == "4"
    main_menu

  else
    puts "Invalid input - to return to main menu, enter '4' with no quotations"
    game_menu

  end

end

def balance_menu
  puts "~=~=~=~=~= DPL CASINO =~=~=~=~=~ "
  puts "Current balance: $#{@balance}"
  puts "1.) Add funds"
  puts "2.) Main menu"
  puts "~=~=~=~ $$ WIN MONEY $$ ~=~=~=~ "

  balance_choice = gets.strip
  if
    balance_choice == "1"
    puts "How much do you want to deposit? (Dollar bills only - no change accepted.)"
    deposit = gets.to_i
    if 
      deposit <= 0
      puts "Invalid input - enter a positive amount."
      balance_menu
    elsif
      deposit < 25
      puts "No low rollers - deposit at least $25."
      balance_menu
    elsif
      deposit > 100000
      puts "For legal reasons, we can not accept deposits over $100,000."
      balance_menu

    else
      puts "You have successfully deposited $#{deposit}."
      @balance += deposit
      puts "Your balance is now $#{@balance}"
      balance_menu
    end

  elsif
    balance_choice == "2"
    main_menu
  else
    puts "Invalid input - try again"
    balance_menu
  end
end

def cashout_menu
  puts "~=~=~=~=~= DON'T LEAVE =~=~=~=~=~ "
  puts "Current balance: $#{@balance}"
  puts "Are you sure you want to go? (y/n)"
  puts "~=~=~=~ GAMBLE YOUR HEART OUT ~=~=~=~ "
  final_input = gets.strip
  if
    final_input == "y"
    puts "See you next time!"
    exit
  else
    puts "Welcome back!"
    main_menu
  end
end

main_menu