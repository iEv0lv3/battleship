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
end
