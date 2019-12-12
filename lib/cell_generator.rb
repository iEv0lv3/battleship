require './lib/cell'

class CellGenerator
  attr_reader :filename, :cells_hash, :user_input

  def initialize(filename, user_input)
    @filename = filename
    @user_input = user_input
    @cells = nil
  end

  def cells
    cells_hash = {}
    cells = File.open(@filename).first(@user_input)
    cells = cells.map do |cell|
      cell.strip!
    end
    cells.each do |cell|
      next_cell = cell
      (@user_input).times do
        cells_hash[next_cell] = Cell.new(next_cell)
        if next_cell.next[1] != '0'
          next_cell = next_cell.next
        elsif next_cell.next[1] == '0'
          next_cell[1] = '10'
        end
      end
      require 'pry'; binding.pry
    end
    cells_hash
  end
end

filename = 'cells.txt'
cell_set = CellGenerator.new(filename, 10).cells
require 'pry'; binding.pry