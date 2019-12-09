class Ship
  attr_reader :length
  attr_accessor :health, :name

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
