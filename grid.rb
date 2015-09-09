class Grid
  def initialize
    @ships = []
  end

  def has_ship_on?(x,y)
    @ships.each do |ship|
      return true if ship.covers?(x,y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships << ship

    # if has_ship_on?(x,y)
    #   puts "A ship is already placed!"
    # else
    #   @ships << ship

  end


  end

  def display
    puts empty_grid
  end

  def empty_grid
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end
end
