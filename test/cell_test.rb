require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_cell_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
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

  def test_cell_has_not_been_fired_upon
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal ".", cell_1.render
  end

  def test_cell_has_been_fired_upon_and_no_ship
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_cell_fired_upon_and_has_ship
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "H", cell_1.render
  end

  def test_reveal_ship_in_cell_if_not_fired_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    assert_equal "S", cell_2.render(true)
  end

  def test_ship_can_be_sunk_and_render_x
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
    2.times do
      cruiser.hit
    end
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render
  end
end
