class User
  attr_accessor :board

  def initialize
    @board = Board.new
  end
end