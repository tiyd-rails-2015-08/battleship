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
    puts "#{@name}, where would you like to place a ship of length #{@ships[0].length}?"
      get_user_input
    puts "Across or Down?"
      get_user_input
    puts "#{@name}, where would you like to place a ship of length #{@ships[1].length}?"
      get_user_input
    puts "Across or Down?"
      get_user_input
  end

  @ships << Ship.new(2)
  @ships << Ship.new(5)





end
