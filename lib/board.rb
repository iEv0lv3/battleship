class Board
attr_accessor :cells

  def initialize
    @cells = create_board_cells
  end

  def create_board_cells
    cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.length != ship.length
    letters = []
    numbers = []
    next_num = 1
    coordinates.each do |coordinate|
      letters << coordinate.split(//)[0]
      numbers << coordinate.split(//)[1]
    end
    if letters.uniq.length == 1
      numbers.each do |num|
        num = num.to_i
        if num.next != numbers[next_num].to_i && numbers.last == false
          return false
        elsif num.next == numbers[next_num].to_i && numbers.last == true
          return true
        elsif num.next == numbers[next_num].to_i
          next_num += 1
        end
      end
      true
    end
  end

end
