class Game
  attr_reader :human_user, :computer_user, :turn_number, :game_number

  def initialize
    @human_user = User.new
    @computer_user = User.new
    @turn_number = 0
    @new_game = nil
  end

  def start_game
    @new_game = Game.new
    @human_user = User.new
    @computer_user = User.new
    @turn_number = 0
    @new_game.game_setup
  end

  def game_setup
    turn = Turn.new(@turn_number, @computer_user, @human_user)
    return unless turn.welcome_screen == 'p'

    human_game_setup
  end

  def human_game_setup
    turn = Turn.new(@turn_number, @human_user, @computer_user)
    turn.human_first_turn
    @turn_number += 1
    play_game
  end

  def play_game
    loop do
      human_lose = @human_user.ships.all?(&:sunk?)
      cpu_lose = @computer_user.ships.all?(&:sunk?)
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
    start_game
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
