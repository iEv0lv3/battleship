require 'pry'
class Turn
  attr_reader :user, :turn_number
  def initialize(turn, user)
    @turn_number = turn
    @user = user
  end

  def start_turn_0
    @user.ships.each do |ship|
      @user.board.place(ship, @user.board.placement_options(ship))
    end
    binding.pry
  end
end
