require "minitest/autorun"
require "fifteen"

class FifteenTest < Minitest::Unit::TestCase
  # def new_instance_is_a_number
  #   number = Number.new
  #   refute nil number
  # end

  # def test_start_of_game_array_is_one_to_nine
  #   assert_equal NumberArray.new, [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # end
  #if we have NumberArray class, we will need to test it thusly

  def is_beginning_array_all_9_numbers
    assert_equal @number_pool,  [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

#   def test_player_choice_removed_from_number_pool
#     player_choice = 1
#     assert_equal number_pool, [2,3,4,5,6,7,8,9]
#   end
# #test winner
#
# end
end
