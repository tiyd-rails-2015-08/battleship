class Grid

  def initialize
    #Creates new array with 100 Position objects
     @locations = Array.new(100)
       (1..100).each do |i|
         @locations[i] = Position.new
       end
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

  def display
    puts empty_grid
  end

  def place_ship(ship_object, x, y, j = false)

  end

  def has_ship_on?(x, y)
    position_objects_array.each
    # search through Array of position objects and
    # if a position object in the array has .x == x && .y == y return true

  end

end
