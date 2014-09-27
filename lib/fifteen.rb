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

# issues as of 4pm on 9/27:
# need to define sum (called in score_player and score_computer)
# could add logic if player does not specify a guess between one and nine
     # if player_choice == 1..9
       # puts "That is not a number between 1 and 9; please guess again."
       # player_turn
     #else

  def player_turn #need argument here?
    puts "What number do you choose?"
    player_choice = gets.chomp.to_i
    @number_pool.delete(player_choice)
    @player_numbers << player_choice
      if @player_numbers.size >= 3
        score_player
      else
        computer_turn
      end
  end

  def score_player
    play_num = @player_numbers.combination(3).to_a
    if play_num.any?{ |array| sum(array) == 15 }
      puts "You Win"
      game.new
      #NameError: undefined local variable or method `play_again' for #<Game:0x007ff86cb1ead8> from fifteen.rb:51:in `score_player'
    else
    end
  end

  def computer_turn
    computer_choice = @number_pool.sample
    puts "The computer chose #{computer_choice}"
    @number_pool.delete(computer_choice)
    @computer_numbers << computer_choice
    if @computer_numbers.size >= 3
      score_computer
      # @computer_numbers.did_ye_win
    # Array(@computer_numbers).combination(3).find_all { |x, y, z| x + y + z == 15 } || []
    # puts "#{Array}"
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
    end
  end
end

# Only invoke did_ye_win after each player has three numbers. Need a counter for number of guesses.
  #
  # def did_ye_win(numbers, sum)
  #
    # Right now, this is general, and we want it to apply to both. We also need to call this method on each player's set of guesses only, not the whole array of numbers. Do we need to make two different methods or call the method twice per round, once on computer and once on player?
  #
  #   # numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  #   @player_numbers = numbers
  #   sum = ARGV.empty? ? 15 : ARGV.first.to_i
  # end
  #
    # We really want this to be three different options, player win, computer win, or no one win.
    # if results.size > 1
    #   puts "Computer won."
    # elsif  Array(@player_numbers).combination(3).find_all { |x, y, z| x + y + z == sum } || []
    #   puts "Player won."
    # else
    #   puts "Keep trying" and makes game continue to play.
    # end
  # end
  # def is_the_game_unwinnable
  # end

# def number
#   @number
# end

game1 = Game.new
  puts  "Welcome to our game of 15. You and the computer will take turns choosing one number at a time between 1 to 9. Someone wins if they have said three numbers that sum to 15. Once a number is chosen, it can't be used again this round. Note that any combination of three numbers you mentioned can be used."
game1.player_turn
game1.computer_turn
# having player_turn and computer_turn mentioned down here (outside of class) is necessary for game to run properly
  puts "Game over"
