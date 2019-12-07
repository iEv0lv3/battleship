require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'
require './lib/board'
require './lib/cell'

class BoardTest < Minitest::Test
  def test_if_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_16_cells_and_cell_data_is_accurate
    board = Board.new
    assert_equal "A1", board.cells["A1"].coordinate
    assert_equal "B2", board.cells["B2"].coordinate
    assert_equal "C3", board.cells["C3"].coordinate
    assert_equal "D4", board.cells["D4"].coordinate
    assert_equal 16, board.cells.size
  end

  def test_valid_coordinate_method
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_valid_ship_placement_coordinates_equal_ship_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_valid_ship_horizontal_ship_placement
    board = Board.new
    carrier = Ship.new("Carrier", 3)

    assert_equal true, board.valid_placement?(carrier, ["A1", "A2", "A3"])
    assert_equal false, board.valid_placement?(carrier, ["A1", "A2", "A4"])
  end

  def test_valid_vertical_ship_placement
    board = Board.new
    carrier = Ship.new("Carrier", 3)

    assert_equal true, board.valid_placement?(carrier, ["A1", "B1", "C1"])
    assert_equal false, board.valid_placement?(carrier, ["A1", "C1", "D1"])
  end

  def test_diagonal_ship_placement_not_valid
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_valid_ship_placement_final
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_ship_can_be_placed_on_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cruiser, board.cells['A1'].ship
    assert_equal cruiser, board.cells['A2'].ship
    assert_equal cruiser, board.cells['A3'].ship
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_that_ships_will_not_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ['A1', 'B1'])
    assert_equal false, board.valid_placement?(cruiser, ['A2', 'B2', 'C2'])
  end

  def test_board_render_produces_output
    board = Board.new

    assert_output "  1 2 3 4", board.render
                  "A . . . ."
                  "B . . . ."
                  "C . . . ."
                  "D . . . ."
  end
end
