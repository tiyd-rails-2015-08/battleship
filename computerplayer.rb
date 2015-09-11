require './player'
require './ship'

class ComputerPlayer < Player
  attr_reader :name, :grid, :ships, :x, :y

  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
    @computer_shot = []
    @x = x
    @y = y
  end

  def place_ships(length_array = [2, 3, 3, 4, 5])
    counter = 0
    loop do |s|
      s = length_array[counter]
      ship = Ship.new(s)
      random = rand(0..9)
      x = random
      y = random
      horizontal = [true, false]
      if @grid.place_ship(ship, x, y, horizontal)
        counter = counter + 1
        @ships << ship
        break if @ships.length == length_array.length
      end
    end
   puts "#{@name} has placed its ships.\n"
  end

  def call_shot
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    random = rand(0..9)
    @y = random.to_s
    @x = letters.sample
    @x + @y
  end

end
