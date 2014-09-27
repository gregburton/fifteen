# class Player
# end
#
# class Computer
# end
# We don't have multiple classes yet. Potential other classes are player anc computer.

class Game
  # attr_reader , we might need this later
  def initialize
    # @number_pool = number_pool
    # @number_pool << [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @number_pool = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_numbers = []
    @computer_numbers = []
  end

  def sum(array)
    array.inject{ |sum, x| sum + x}
  end

  # We could make these into classes
  # Need to put some way of randomly choosing who goes first.
  # Need a while statement. ex: while result.size < 1 && number pool !=[],

# issues:
# could add logic if player does not specify a guess between one and nine
# need to keep the game going if no one has won after 3 rounds AND also allow to end if someone wins

  def player_turn
    puts "What number do you choose?"
    player_choice = gets.chomp.to_i
    @number_pool.delete(player_choice)
    @player_numbers << player_choice
      if @player_numbers.size >= 3
        score_player
        computer_turn
      else
        computer_turn
      end
  end

  def score_player
    play_num = @player_numbers.combination(3).to_a
    if play_num.any?{ |array| sum(array) == 15 }
      puts "You Win"
      play_again
    # else
    #   computer_turn
    end
  end

  def computer_turn
    computer_choice = @number_pool.sample
    puts "The computer chose #{computer_choice}"
    @number_pool.delete(computer_choice)
    @computer_numbers << computer_choice
    if @computer_numbers.size >= 3
      score_computer
      player_turn
    else
      player_turn
    end
  end

  def score_computer
    comp_num = @computer_numbers.combination(3).to_a
    if comp_num.any?{ |array| sum(array) == 15}
      puts "Computer Wins"
      play_again

    # else
    #   player_turn
    end
  end

  def play_again
    loop do
      restart = Game.new
      restart.player_turn
      restart.computer_turn
      # having player_turn and computer_turn mentioned here is (likely) necessary for game to run properly
      puts "Game over. Would you like to play again? (Y)es or (N)o?"
        player_response = gets.chomp.to_s
        break if player_response.upcase == "N"
    end
  end
end

loop do
  game1 = Game.new
  puts "Welcome to our game of 15. You and the computer will take turns choosing one number at a time between 1 to 9. Someone wins if they have said three numbers that sum to 15. Once a number is chosen, it can't be used again this round. Note that any combination of three numbers you mentioned can be used."
  game1.player_turn
  game1.computer_turn
  # having player_turn and computer_turn mentioned down here (outside of class) is necessary for game to run properly
  puts "Game over. Would you like to play again? (Y)es or (N)o?"
    player_response = gets.chomp.to_s
    break if player_response.upcase == "N"
end
