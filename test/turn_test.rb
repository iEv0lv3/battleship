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
    skip
    turn = 0
    user1 = User.new
    turn1 = Turn.new(turn, user1)

    assert_instance_of Turn, turn1
  end

  def test_turn_attributes
    skip
    turn = 0
    user1 = User.new
    turn1 = Turn.new(turn, user1)

    assert_equal 0, turn1.turn_number
    assert_instance_of User, user1
  end

  def test_computer_can_random_sample
    skip
    turn = 0
    user1 = User.new
    turn1 = Turn.new(turn, user1)

  end
end
