require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/user'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    turn = 0
    user1 = User.new
    turn1 = Turn.new(turn, user1, opponent)

    assert_instance_of Turn, turn1
  end

  def test_turn_attributes
    turn = 0
    user1 = User.new
    turn1 = Turn.new(turn, user1, opponent)

    assert_equal 0, turn1.turn_number
    assert_instance_of User, user1
  end
end
