require './player'

class ComputerPlayer < Player
  def initialize(grid_size = [10,10])
    @name = "HAL 9000"
    @shots = []
    @grid = Grid.new(grid_size)
    super()
  end

  def place_ships(array_of_ship_lengths = [2,3,3,4,5])
    array_of_ship_lengths.each do |ship_length|
      across = [true,false].sample
      position = @grid.board.keys.sample

      # Create the ship and determine x,y coordinations
      newship = Ship.new(ship_length)
      x = @grid.x_of(position)
      y = @grid.y_of(position)

      # Determine if grid already has something placed there
      redo unless @grid.place_ship(newship, x, y, across)

      @ships << newship
    end
    puts "#{@name} has placed its ships."
  end

  def call_shot
    guess = nil
    until guess
      guess = @grid.board.keys.sample
      !@shots.include?(guess) || guess = nil
    end
    @shots << guess
    @shots_fired << Position.new(position: guess)
    guess.to_s
  end

end
