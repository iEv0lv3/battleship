class Game
  attr_reader :human_user, :computer_user, :turn_number, :game_number

  def initialize
    @human_user = User.new
    @computer_user = User.new
    @turn_number = 0
    @new_game = play_game
  end

  def play_game
    game_setup
    loop do
      human_lose = @human_user.ships.all? do |ship|
        ship.sunk?
      end
      cpu_lose = @computer_user.ships.all? do |ship|
        ship.sunk?
      end
      if human_lose == true
        puts 'I won!'
        break
      elsif cpu_lose == true
        puts 'You won!'
        break
      else
        take_turn
      end
    end
    @new_game = Game.new
    play_game
  end

  def game_setup
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets.chomp.downcase.strip
    if choice == 'q'
      puts "Goodbye."
    elsif choice == 'p'
      turn = Turn.new(@turn_number, @computer_user, @human_user)
      turn.cpu_first_turn
      puts "I have laid out my ships on the grid."
      human_game_setup
    end
  end

  def human_game_setup
    turn = Turn.new(@turn_number, @human_user, @computer_user)
    turn.human_first_turn
    @turn_number += 1
  end

  def take_turn
    if @turn_number.odd?
      new_turn = Turn.new(@turn_number, @human_user, @computer_user)
      new_turn.human_turn
      @turn_number += 1
    else
      new_turn = Turn.new(@turn_number, @computer_user, @human_user)
      new_turn.cpu_turn
      @turn_number += 1
    end
  end
end
