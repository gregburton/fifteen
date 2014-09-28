require "minitest/autorun"
require "fifteen"

class FifteenTest < Minitest::Unit::TestCase

  def test_start_of_game_array_is_one_to_nine_and_players_start_with_zero_guesses
    @player_numbers = []
    @computer_numbers = []
    assert_equal @number_pool.sort, [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def test_is_beginning_array_all_9_numbers
    assert_equal @number_pool.sort, [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end


  def test_player_choice_removed_from_number_pool
    player_choice = 1
    assert_equal @number_pool.sort, [2, 3, 4, 5, 6, 7, 8, 9]
  end

  def test_player_winner
    play_num = [2, 5, 8]
    sum(play_num) = 15
    assert puts "You Win!"
  end

  def test_computer_winner
    play_num = [3, 5, 7]
    sum(play_num) = 15
    assert puts "Computer Wins"
  end

  def test_game_ends_when_number_pool_is_empty
    @number_pool = []
    assert puts 
  end
end
