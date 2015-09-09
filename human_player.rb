require './player'

class HumanPlayer < Player
  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new()
    @ships = []
  end

  def place_ships(array_of_ship_lengths = [2,3,3,4,5])
    array_of_ship_lengths.each do |ship_length|

      # Collect position from user
      position = ""
      loop do
        puts "#{@name}, where would you like to place a ship of length #{ship_length}?"
        position = get_user_input
        break if @grid.board.has_key?(position.to_sym)
        puts "That is an invalid position."
      end

      # Collect across/down from user
      across = nil
      until !across.nil?
        puts "Across or Down?"
        across_response = get_user_input
        across = true if across_response.downcase == "across"
        across = false if across_response.downcase == "down"
        puts "That is an invalid direction." if across.nil?
      end

      # Create the ship and determine x,y coordinations
      newship = Ship.new(ship_length)
      x = @grid.x_of(position)
      y = @grid.y_of(position)

      # Determine if grid already has something placed there
      unless @grid.place_ship(newship, x, y, across)
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        redo
      end

      @ships << newship
    end

  end
end
