class Ship
  attr_reader :length, :name
  attr_accessor :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    @health.zero?
  end

  def hit
    @health -= 1
  end
end
