require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/user'

class UserTest < Minitest::Test

  def test_user_exists
    user1 = User.new

    assert_instance_of User, user1
  end

  def test_user_attributes
    user1 = User.new

    assert_instance_of Board, user1.board
  end

  def test_can_add_new_ships
    skip
    user1 = User.new
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('submarine', 2)

    assert_equal [cruiser, submarine], user1.new_ships
  end
end
