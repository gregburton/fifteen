require "minitest/autorun"
require "fifteen"

class FifteenTest < Minitest::Unit::TestCase
  # def new_instance_is_a_number
  #   number = Number.new
  #   refute nil number
  # end

  def test_start_of_game_array_is_one_to_nine
    assert_equal NumberArray.new, [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
