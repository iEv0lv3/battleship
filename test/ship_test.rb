require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test
  def test_ship_exists
    cruiser = Ship.new('Cruiser', 3)

    assert_instance_of Ship, cruiser
  end

  def test_ship_has_length_and_length_and_health
    cruiser = Ship.new('Cruiser', 3)

    assert_equal 'Cruiser', cruiser.name
    assert_equal 3, cruiser.length
    assert_equal 3, cruiser.health
  end

  def test_ship_starts_sunk_equals_false
    cruiser = Ship.new('Cruiser', 3)

    assert_equal false, cruiser.sunk?
  end
end
