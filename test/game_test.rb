require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/turn'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/user'
require 'pry'

class GameTest < Minitest::Test
  def test_game_class_exists
    game1 = Game.new

    assert_instance_of Game, game1
  end

  def test_game_attributes
    game1 = Game.new
    binding.pry
    assert_instance_of User, game1.human_user
    assert_instance_of User, game1.computer_user
  end
end
