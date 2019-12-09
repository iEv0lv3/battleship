class User
  attr_accessor :board, :ships

  def initialize
    @board = Board.new
    @opponent_board = Board.new
    @ships = new_ships
  end

  def new_ships
    [Ship.new('cruiser', 3), Ship.new('submarine', 2)]
  end
end
