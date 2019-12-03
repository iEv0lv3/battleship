class Ship
  attr_reader :name, :length
  attr_accessor :healh

  def initialize(name, length)
    @name = name
    @length = length
    @healh = nil
  end

  def health
    @healh = @length
  end
end
