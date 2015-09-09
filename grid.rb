
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

  def place_ship (ship, x, y, horizontal)
    #Checks if spaces are occupied
    if horizontal
      (x..x+ship.length-1).each do |i|
        return false if has_ship_on?(i, y)
      end
    else
      (y..y+ship.length-1).each do |i|
        return false if has_ship_on?(x, i)
      end
    end
    #Places ship horizontally or vertically
      ship.place(x, y, horizontal)
      if horizontal
        (x..x+ship.length-1).each do |i|
          @locations[get_position(i, y)].occupied = true
        end
      else
        (y..y+ship.length-1).each do |i|
          @locations[get_position(x, i)].occupied = true
        end
      end
  end

  def get_position(x, y)
    #Converts x,y coordinates to corresponding array index
    x + y * 10
  end

  def has_ship_on?(x, y)
    #Checks if position is occupied
    @locations[get_position(x,y)].occupied
  end

end
