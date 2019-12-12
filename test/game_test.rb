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
    new_game = Game.new

    assert_instance_of Game, new_game
  end

  def test_game_attributes
    new_game = Game.new

    assert_instance_of User, new_game.human_user
    assert_instance_of User, new_game.computer_user
  end
end
