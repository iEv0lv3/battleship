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
      turn.start_turn_0
      puts "I have laid out my ships on the grid."
    end
  end

  def human_turn_0
    puts "You now need to lay out your #{@human_user.ships.length} ships."
    puts "The #{@human_user.ships[0].name} is #{@human_user.ships[0].length}
    and the #{@human_user.ships[1].name} is #{@human_user.ships[1].length}
    units long."
    @human_user.board.render
    puts "Enter the squares for the #{@human_user.ships[0].name}
    (#{@human_user.ships[0].length} spaces):"
    print '>'
    gets.chomp.upcase
  end
end
