require './player'

class HumanPlayer < Player

  def initialize(name = "Dave", grid_size = [10,10])
    @name = name
    @grid = Grid.new(grid_size)
    super()
  end

  def place_ships(array_of_ship_lengths = [2,3,3,4,5])
    puts "THE BATTLE FIELD"
    @grid.display
    array_of_ship_lengths.each do |ship_length|

      # Collect position from user
      position = ""
      loop do
        print "#{@name}, where would you like to place a ship of length "\
              "#{ship_length}? "
        position_response = get_user_input
        position = position_response.upcase
        exit if position == "EXIT"
        break if @grid.board.has_key?(position.to_sym)
        puts "That is an invalid position."
      end

      # Collect across/down from user
      across = nil
      until !across.nil?
        print "Across or Down? "
        across_response = get_user_input
        exit if across_response.upcase == "EXIT"

        across = true if across_response.downcase == "across" || across_response.downcase == "a"
        across = false if across_response.downcase == "down" || across_response.downcase == "d"
        puts "That is an invalid direction." if across.nil?
      end

      # Create the ship and determine x,y coordinations
      newship = Ship.new(ship_length)
      x = @grid.x_of(position)
      y = @grid.y_of(position)

      # Determine if grid already has something placed there
      unless @grid.place_ship(newship, x, y, across)
        puts  "Unfortunately, that ship overlaps with one of your other ships."\
              "  Please try again."
        redo
      end

      @ships << newship
      puts "YOUR BOARD:"
      @grid.display
    end

  end

  def call_shot
    guess = nil
    # Loop until I have a valid guess.
    until guess
      puts  "#{@name}, please enter the coordinates for your next shot (e.g. "\
            "'B10'):"
      guess_response = get_user_input
      guess_response = guess_response.upcase
      exit if guess_response == "EXIT"
      guess = guess_response.gsub(/[^A-Z0-9]/,"").to_sym
      redo if @shots_fired.any? { |p| p.position == guess }
      redo if !@grid.board.has_key?(guess)
    end
    @shots_fired.push(Position.new(position: guess))
    guess_response
  end

end
