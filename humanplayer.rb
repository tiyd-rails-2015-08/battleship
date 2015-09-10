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

  def place_ships(length_array)
    counter = 0
    length_array.length.times do
      puts "#{name}, where would you like to place a ship of length #{length_array[counter]}?\nAcross or Down?\n"
      input = get_user_input
      if input.length == 2
        x = grid.x_of(input)
        y = grid.y_of(input)
      elsif input == "Across"
        horizontal = true
      elsif input == "Down"
        horizontal = false
      else
        puts "Error"
      end
      @ships << grid.place_ship(Ship.new(length_array[counter]), x, y, horizontal)
      counter +=
    end
  end

end
