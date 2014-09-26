# class Player
# end
#
# class Computer
# end
#We don't have multiple classes yet.  Potential other classes are player anc computer.

class Game
  # attr_reader , we might need this later
  def initialize
    @number_pool = number_pool
    number_pool << [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_numbers = []
    @computer_numbers = []
  end

  def greeting
    puts  "Welcome to our game of 15.  You and the computer will take   turns choosing one number at a time from 1 to 9.  Once a number is chosen, it can't be used again this round.  Someone wins if they have said three numbers that sum to 15.  Note that any combination of three that you have mentioned can be used."
  end
  #we could make these into classes
  def player_turn
    puts "What number do you choose?"
    gets.chomp_to.i = player_choice
    @number_pool.delete(player_choice)
    @player_numbers << player_choice
  end

  def computer_turn
    @number_pool.sample = computer_choice
    puts "The computer chose #{computer_choice}"
    @number_pool.delete(computer_choice)
    @computer_numbers << computer_choice
  end



  def did_ye_win(numbers, sum)
  #right now, this is general, and we want it to apply to both.  Do we need to make two different methods or call the method twice, once on computer and once on player?
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    sum     = ARGV.empty? ? 15 : ARGV.first.to_i

    def sum_exists(numbers, sum)
      Array(numbers).combination(3).find_all { |x, y, z| x + y + z == sum } || []
    end

    result = sum_exists(numbers, sum)

    puts "given this array of choices: #{numbers.inspect}"
    puts "#{result.size} pairs add up to #{sum}: #{result.inspect}"

    if result.size => 1
      puts "Win"
    end

    # if results.size > 1
    #   puts "Computer won."
    # elsif  Array(@player_numbers).combination(3).find_all { |x, y, z| x + y + z == sum } || []
    #   puts "Player won."
    # else
    #   puts "Keep trying"
    # end
  end
  # def is_the_game_unwinnable
  # end
end

# def number
#   @number
# end
