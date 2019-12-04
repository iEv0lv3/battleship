require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_cell_is_empty
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
    cell.ship = true
    assert_equal false, cell.empty?
  end

  def test_ship_can_be_placed_in_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
    assert_instance_of Ship, cell.ship
  end

  def test_cell_has_fired_upon_method_in_instance_variable
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cell.fired_upon?
  end

  def test_fire_upon_cell_and_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal true, cell.fired_upon?
    assert_equal 2, cell.ship.health
    2.times do
      cell.fire_upon
    end
    assert_equal true, cell.ship.sunk?
  end

end
