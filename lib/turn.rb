require 'pry'
class Turn
  attr_reader :user, :turn_number
  def initialize(turn, user)
    @turn_number = turn
    @user = user
  end

  def cpu_turn_0
    @user.ships.each do |ship|
      @user.board.place(ship, @user.board.placement_options(ship))
    end
  end

  def human_turn_0
    puts "You now need to lay out your #{@user.ships.length} ships."
    puts "The #{@user.ships[0].name} is #{@user.ships[0].length} units and the #{@user.ships[1].name} is #{@user.ships[1].length} units long."

    @user.board.render
    human_ship_placement_input
  end

  def human_ship_placement_input
    @user.ships.each do |ship|
      loop do
        puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
        print '>'
        user_input = gets.chomp.upcase
        coordinates = split_human_coordinates(user_input)
        if validate_human_input(ship, coordinates) == true
          break
        end
      end
    end
  end

  def validate_human_input(ship, coordinates)
    if coordinates.length != ship.length
      puts 'Those are invalid coordinates. Please try again.'
    elsif coordinates.all? { |cell| @user.board.cells.include?(cell) } == false
      puts 'Those are invalid coordinates. Please try again.'
    else
      @user.board.place(ship, coordinates)
      @user.board.render(true)
      true
    end
  end

  def split_human_coordinates(user_input)
    user_input.split(' ')
  end
end
