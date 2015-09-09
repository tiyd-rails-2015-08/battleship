require './player'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(ship_sizes)
    ship_sizes.each do |size|
      @ships << Ship.new(size)
    end
    @ships.each do |ship|
      puts "#{@name}, where would you like to place a ship of length #{ship.length}?"
      position = get_user_input
      puts "Across or Down?"
      across = get_user_input
      across.downcase!
      across == "across" ? (across = true) : (across = false)
      if @grid.place_ship(ship, @grid.x_of(position), @grid.y_of(position), across) == false
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      end
    end
  end







end
