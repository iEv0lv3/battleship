class Ship
  attr_reader :name, :length
  attr_accessor :health, :hits

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hits = 0
  end

  def sunk?
    @health.zero?
  end
end
