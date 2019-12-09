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

    @user.ships.each do |ship|
      puts "Enter the squares for the #{ship.name}(#{ship.length} spaces):"
      print '>'
      user_input = gets.chomp.upcase
      coordinates = split_human_coordinates(user_input)
      binding.pry
      @user.board.place(ship, coordinates)
      @user.board.render(true)
    end
  end


  def split_human_coordinates(user_input)
    user_input.split(' ')
  end
end
