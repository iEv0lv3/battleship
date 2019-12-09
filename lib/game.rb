class Game
  attr_reader :human_user, :computer_user, :turn_number

  def initialize
    @human_user = User.new
    @computer_user = User.new
    @turn_number = 0
  end

  def game_start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets.chomp.downcase.strip
    if choice == 'q'
      puts "Goodbye."
    elsif choice == 'p'
      turn = Turn.new(@turn_number, @computer_user)
      turn.cpu_turn_0
      puts "I have laid out my ships on the grid."
      human_game_start
    end
  end

  def human_game_start
    turn = Turn.new(@turn_number, @human_user)
    turn.human_turn_0
  end
end
