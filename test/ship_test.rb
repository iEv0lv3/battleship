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

  def test_ship_can_take_hits_and_is_sunk_at_0_health
    cruiser = Ship.new('Cruiser', 3)
    cruiser.hit

    assert_equal 2, cruiser.health

    cruiser.hit

    assert_equal 1, cruiser.health

    cruiser.hit

    assert_equal 0, cruiser.health
    assert_equal true, cruiser.sunk?
  end
end
