class Game
  attr_reader :human_user, :computer_user

  def initialize
    @human_user = User.new
    @computer_user = User.new
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end
end
