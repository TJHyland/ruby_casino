def dice_game

puts 'Let\'s play dice, ya\'ll!'
while @balance > 0
	puts 'Place your bet! You have ' + @balance.to_s + ' chips left!'
	@bet = gets.chomp
	while true
		if (@balance.to_i - @bet.to_i) < 0
			puts 'You don\'t have that many chips! Try again.'
			@bet = gets.chomp
		else
			break
		end
	end
	if @bet.to_i > 5
		puts @bet.to_s + '?! You high rollin.'
		puts 'I\'ll roll two dice. What do you think the total will be?'
	else
		puts @bet.to_s + '?! Just that much.'
		puts 'I\'ll roll two dice. What do you think the total will be?'
	end
	total = gets.chomp
	dice_total = ((1 + rand(6))+(1 + rand(6)))
	print 'The total was ' + dice_total.to_s + '! '
	if dice_total.to_i == total.to_i
		@balance = @balance.to_i + @bet.to_i
		puts 'You win! Nice job!'
	else
		@balance = @balance.to_i - @bet.to_i
		puts 'Not this time, my friend!'
	end
end
puts 'GAME OVER. Don\'t quit your day job,'
puts 'unless your day job is playing dice.'
main_menu

end
