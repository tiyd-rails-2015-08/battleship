def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :grid, :ships
  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def random
      rand(0..9)
  end

  def place_ships(length_array = [2, 3, 3, 4, 5])
    counter = 0
    loop do |s|
      s = length_array[counter]
      ship = Ship.new(s)
      puts "#{name}, where would you like to place a ship of length #{s}?"
      input = get_user_input
      x = @grid.x_of(input)
      y = @grid.y_of(input)
      puts "Across or Down?"
      input = get_user_input
      if input == "Across"
        horizontal = true
      elsif input == "Down"
        horizontal = false
      end
      if @grid.place_ship(ship, x, y, horizontal)
        counter = counter + 1
        @ships << ship
        if @ships.length == length_array.length
          break
        end
      else
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      end
    end
  end

end
