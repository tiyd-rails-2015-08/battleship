class Grid

  def initialize()
    #Creates new array with 100 Position objects
    @locations = Array.new(100)
      (1..100).each do |i|
        @locations[i] = Position.new
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

  def place_ship (ship, x, y, across)
    #Checks if spaces are occupied
    if across
      (x..x+ship.length-1).each do |i|
        return false if has_ship_on?(i, y)
      end
    else
      (y..y+ship.length-1).each do |i|
        return false if has_ship_on?(x, i)
      end
    end
    #Places ship horizontally or vertically
      ship.place(x, y, across)
      if across
        (x..x+ship.length-1).each {|i| @locations[get_position(i, y)].occupied = true}
      else
        (y..y+ship.length-1).each { |i| @locations[get_position(x, i)].occupied = true}
      end
  end

  def fire_at(x, y)
    #Checks if location has been fired at previously
    if (1..10).include?(x) && (1..10).include?(y)
      if @locations[get_position(x,y)].fired_at
        #Automatic miss
        return false
      else
        #Marks location as fired_at and checks for a hit
        @locations[get_position(x,y)].fired_at = true
        has_ship_on?(x,y)
      end
    else
      false
    end
  end

  def sunk?()
    empty_grid = true
    (1..100).each do |i|
      if @locations[i].occupied
        @locations[i].fired_at ? () : (return false)
        empty_grid = false
      end
    end
    !empty_grid
  end

  def x_of
  end

  def y_of
  end

  def display()
    #Outputs game grid to the user
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
