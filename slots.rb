@slot_items = ["APPLES", "ORANGES"]

def start_slots
  puts "    
 Let's play APPLES and ORANGES!

          .-------.
       .=============.
       | [a] [a] [o] | __
       | [$] [$] [$] |(  )
       | [o] [o] [a] | ||
       |             | ||
       | aaa ::::::: |_||
       | ooo ::::::: |__'
       | $$$ ::::::: |
       |             |
       |      __ === |
       |_____|__|____|
      |###############|
     |#################|
    |___________________|
    
---Feeling lucky? Type 'Y' to pull the lever.---\n        ---Or type 'N' to go back.---\n\n"

lever_option
end

def lever_option
lever_pull = gets.strip.upcase
  if lever_pull == "Y"
    puts "How much will you bet?"
    @bet = gets.to_i
    @balance -= @bet
    puts "You bet $#{@bet}"
    run_slot_1
  elsif lever_pull == "N"
    puts "You can't win what you don't put down!"
    main_menu
  else 
    puts "Invalid response. Please try again."
    start
  end
end


def run_slot_1
  puts "Nice pull! Waiting for slot one... \n"
    sleep(4)
  slot1 = @slot_items.sample
  puts "Slot one returned #{slot1}! \n"
    sleep(1)
  puts "Waiting for slot two... \n"
    sleep(5)
  # run_slot_2
  slot2 = @slot_items.sample
  puts "Slot two returned #{slot2}!"
  # slot_checker
    if slot1 == slot2
      puts "Congratulations! You got a winning combination of #{slot1} and #{slot2}. You win $#{@bet}"
      @balance += (2 * @bet)
    else
      puts "Awe, your slots didn't match this time. Try again to win your money back!"
    end
end

# def run_slot_2
#   slot2 = @slot_items.sample
#   puts "Slot 2 returned #{slot2}! \n"
# end

# def slot_checker
#   if @slot1 == @slot2
#     puts "Congratulations! You got a winning combination of #{@slot1} and #{@slot2} to double your bet!"
#   else
#     puts "Awe, your slots didn't match this time. Try again to win your money back!"
#   end
# end



start_slots