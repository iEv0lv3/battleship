class Game
  attr_reader :human_user, :computer_user, :turn_number

  def initialize
    @human_user = User.new
    @computer_user = User.new
    @turn_number = 0
  end

  def game_setup
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets.chomp.downcase.strip
    if choice == 'q'
      puts "Goodbye."
    elsif choice == 'p'
      turn = Turn.new(@turn_number, @computer_user, @human_user)
      turn.cpu_turn_0
      puts "I have laid out my ships on the grid."
      human_game_setup
    end
  end

  def human_game_setup
    turn = Turn.new(@turn_number, @human_user, @computer_user)
    turn.human_turn_0
    @turn_number += 1
  end

  def take_turn
    if @turn_number.odd?
      new_turn = Turn.new(@turn_number, @human_user, @computer_user)
    else
      new_turn = Turn.new(@turn_number, @computer_user, @human_user)
    end
  end
end
