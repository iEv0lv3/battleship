class User
  attr_accessor :board, :ships, :opponent_board

  def initialize
    @board = Board.new
    @opponent_board = Board.new
    @ships = new_ships
  end

  def new_ships
    [Ship.new('cruiser', 3), Ship.new('submarine', 2)]
  end
end
