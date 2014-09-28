# class Number
#
# end
#
# class Player
#
# end
#
# class computer
#
# end


class Game
  # attr_reader , we might need this later
  def initialize
    # @number_pool = number_pool
    # @number_pool << [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @number_pool = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_numbers = []
    @computer_numbers = []
    # potential method for randomizing if we can get player and computer classes: @players = [HumanPlayer.new(self), ComputerPlayer.new(self)]
    #     rotate_players if rand(2) == 1
  end

  def sum(array)
    array.inject{ |sum, x| sum + x}
  end

  def flip
    @coin = [1, 2]
    result = @coin.sample
    if result == 1
      player_turn
    else
      computer_turn
    end
  end

  # We could make these into classes
  # Need to put some way of randomly choosing who goes first.
  # Need a while statement. ex: while result.size < 1 && number pool !=[],

# issues:
# need to keep the game going if no one has won after 3 rounds AND also allow to end if someone wins

  def player_turn
    puts "What number do you choose?"
    player_choice = gets.chomp.to_i
      if @number_pool.include?(player_choice) == false
        puts "Umm...that's not a number between 1 and 9 (and/or hasn't already been guessed). You're better than this...I think?"
        player_turn
      end
    @number_pool.delete(player_choice)
      if @player_numbers.include?(player_choice) == false && @computer_numbers.include?(player_choice) == false
        @player_numbers << player_choice
      end
      if @player_numbers.size >= 3
        score_player
        # computer_turn
      else
        computer_turn
      end
  end

  def score_player
    play_num = @player_numbers.combination(3).to_a
    if play_num.any?{ |array| sum(array) == 15 }
      # doesn't work ... puts = "Player's winning combination (not the whole hand, necessarily) #{play_num}"
      puts "You Win! player numbers are #{@player_numbers} Computer numbers are #{@computer_numbers}. Number pool is #{@number_pool}. "
        play_again
    else
      computer_turn
    end
  end

  def computer_turn
    computer_choice = @number_pool.sample
    puts "The computer chose #{computer_choice}"
    @number_pool.delete(computer_choice)
    @computer_numbers << computer_choice
    if @computer_numbers.size >= 3
      score_computer
      # player_turn
    else
      player_turn
    end
  end

  def score_computer
    comp_num = @computer_numbers.combination(3).to_a
    if comp_num.any?{ |array| sum(array) == 15}
      puts "Computer Wins"
        play_again
    else
      player_turn
    end
  end

  def start
    loop do
    game1 = Game.new
    puts "Welcome to our game of 15. You and the computer will take turns choosing one number at a time between 1 and 9. Someone wins if they have said three numbers that sum to 15. Once a number is chosen, it can't be used again this round. Note that any combination of three numbers you mentioned can be used."
    game1.flip
    game1.player_turn
    game1.computer_turn
    # having player_turn and computer_turn mentioned down here (outside of class) is necessary for game to run properly
    # puts "Game over. Would you like to play again? (Y)es or (N)o?"
    # player_response = gets.chomp.to_s
    # break if player_response.upcase == "N"
    end
  end

  def play_again
    puts "Game over. Would you like to play again? (Y)es or (N)o?"
    player_response = gets.chomp.to_s
    if player_response.upcase == "Y"
      loop do
      game2 = Game.new
      puts "You are a worthy adversary. I am happy to play again with you."
      game2.flip
      game2.player_turn
      game2.computer_turn
    # having player_turn and computer_turn mentioned down here (outside of class) is necessary for game to run properly
      end
    else
      exit
    end
  end

  # def play_again
  #   loop do
  #     restart = Game.new
  #     restart.player_turn
  #     restart.computer_turn
  #     # having player_turn and computer_turn mentioned here is (likely) necessary for game to run properly
  #     puts "Game over. Would you like to play again? (Y)es or (N)o?"
  #       player_response = gets.chomp.to_s
  #       break if player_response.upcase == "N"
  #   end
  # end
end

game1 = Game.new
game1.start
# loop do
#   game1 = Game.new
#   puts "Welcome to our game of 15. You and the computer will take turns choosing one number at a time between 1 to 9. Someone wins if they have said three numbers that sum to 15. Once a number is chosen, it can't be used again this round. Note that any combination of three numbers you mentioned can be used."
#   game1.flip
#   game1.player_turn
#   game1.computer_turn
#   # having player_turn and computer_turn mentioned down here (outside of class) is necessary for game to run properly
#   puts "Game over. Would you like to play again? (Y)es or (N)o?"
#     player_response = gets.chomp.to_s
#     break if player_response.upcase == "N"
# end
