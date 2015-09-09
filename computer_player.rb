require './player'

class ComputerPlayer < Player

  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
  end

  def place_ships(ship_sizes)
    ship_sizes.each do |size|
      @ships << Ship.new(size)
    end
    #@ships.each do |ship|
      # position = get_user_input
      # across = get_user_input
      # across.downcase!
      # across == "across" ? (across = true) : (across = false)
      # @grid.place_ship(ship, @grid.x_of(position), @grid.y_of(position), across)
  #  end
      puts "HAL 9000 has placed its ships."
  end

  def call_shot
    "#{("A".."J").to_a.sample}" + "#{rand(1..10)}"
  end

end
