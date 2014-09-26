def player_turn#need argument here?
  puts "What number do you choose?"
  gets.chomp_to.i = player_choice
  @number_pool.delete(player_choice)
  @player_numbers << player_choice
  if
    @player_numbers.size => 3
    puts "keep playing"
  else
    puts
    "computer's turn"
  end

end
