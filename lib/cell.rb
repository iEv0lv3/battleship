class Cell
  attr_reader :coordinate
  attr_accessor :ship

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
    return "." if !self.fired_upon? && self.empty?
    return "M" if self.fired_upon? && self.empty?
    return "H" if self.fired_upon? && !self.empty? && !self.ship.sunk?
    return "S" if !self.fired_upon? && !self.empty?
    return "X" if self.fired_upon? && !self.empty? && self.ship.sunk?
  end
end
