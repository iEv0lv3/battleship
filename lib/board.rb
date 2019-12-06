require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = create_board_cells
  end

  def create_board_cells
    {
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
    cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.length != ship.length

    letters = []
    numbers = []
    coordinate_split(coordinates, letters, numbers)
    if horizontal_placement?(letters, numbers)
      true
    elsif vertical_placement?(letters, numbers)
      true
    else
      false
    end
  end

  def coordinate_split(coordinates, letters, numbers)
    coordinates.each do |coordinate|
      letters << coordinate.split(//)[0]
      numbers << coordinate.split(//)[1]
    end
  end


  def horizontal_placement?(letters, numbers)
    index = 1

    return false unless letters.uniq.length == 1
    numbers.each do |num|
      num = num.to_i
      if num.next != numbers[index].to_i && numbers.last.to_i != num
        return false
      elsif num.next == numbers[index].to_i && numbers.last.to_i == num.next
        return true
      elsif num.next == numbers[index].to_i && numbers.last.to_i != num
        index += 1
      end
    end
  end

  def vertical_placement?(letters, numbers)
    index = 1
    return false unless numbers.uniq.length == 1

    letters.each do |letter|
      letter = letter.ord
      if letter.next != letters[index].ord && letters.last.ord != letter
        return false
      elsif letter.next == letters[index].ord && letters.last.ord == letter.next
        return true
      elsif letter.next == letters[index].ord && letters.last.ord != letter
        index += 1
      end
    end
  end

  def place(ship, coordinates)
    keys = coordinates
    keys.each do |key|
      @cells[key].place_ship(ship)
    end
  end
end
