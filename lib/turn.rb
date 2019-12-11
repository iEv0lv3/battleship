class Turn
  attr_reader :turn_number, :user, :opponent

  def initialize(turn, user, opponent)
    @turn_number = turn
    @user = user
    @opponent = opponent
  end

  def welcome_screen
    puts 'Welcome to BATTLESHIP'
    puts 'Enter p to play. Enter q to quit.'
    choice = gets.chomp.downcase.strip
    if choice == 'q'
      puts 'Goodbye.'
    elsif choice == 'p'
      cpu_first_turn
    end
  end

  def cpu_first_turn
    @user.ships.each do |ship|
      loop do
        placed = @user.board.place(ship, @user.board.placement_options(ship))
        break unless placed != 'Successfully placed ship!'
      end
    end
    puts 'I have laid out my ships on the grid.'
    'p'
  end

  def human_first_turn
    puts "You now need to lay out your #{@user.ships.length} ships."
    print "The #{@user.ships[0].name} is #{@user.ships[0].length} units and "
    print "the #{@user.ships[1].name} is #{@user.ships[1].length} units long."
    puts ' '
    @user.board.render(true)
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
    elsif @user.board.valid_placement?(ship, coordinates) == false
      puts 'Those are invalid coordinates. Please try again.'
    else
      coordinates.sort!
      @user.board.place(ship, coordinates)
      @user.board.render(true)
      true
    end
  end

  def split_human_coordinates(user_input)
    user_input.split(' ')
  end

  def human_turn
    loop do
      human_boards_display
      puts 'Enter the coordinate for your shot:'
      print '> '
      coordinate = gets.chomp.upcase.strip
      puts ' '
      if @opponent.board.cells.include?(coordinate)
        @opponent.board.cells[coordinate].fire_upon
        puts '=============COMPUTER BOARD============='
        @opponent.board.render
        break
      else
        puts 'Please enter a valid coordinate.'
      end
    end
  end

  def human_boards_display
    puts '=============COMPUTER BOARD============='
    puts ' '
    @opponent.board.render
    puts ' '
    puts '==============PLAYER BOARD=============='
    puts ' '
    @user.board.render(true)
    puts ' '
  end

  def cpu_turn
    keys = @opponent.board.cells.keys
    hit_or_miss = ''
    loop do
      coordinate = keys.sample
      if @opponent.board.cells[coordinate].fired_upon? == false
        @opponent.board.cells[coordinate].fire_upon
        hit_or_miss = coordinate
        break
      end
    end
    if @opponent.board.cells[hit_or_miss].empty?
      puts "My shot on #{hit_or_miss} was a miss."
    else
      puts "My shot on #{hit_or_miss} was a hit."
    end
  end
end
