require 'pry'
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !@ship.nil?
      @ship.hit
    end
  end

  def render(reveal = nil)
    return "." if !fired_upon? && empty?
    return "M" if fired_upon? && empty?
    return "H" if fired_upon? && !empty? && !ship.sunk?
    return "S" if !fired_upon? && !empty? && reveal == true
    return "X" if fired_upon? && !empty? && ship.sunk?
  end
end
