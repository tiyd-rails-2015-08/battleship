class Player

  attr_reader :name

  def initialize(name = "Dave")
    @name = name
  end

end

class HumanPlayer < Player

end

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
  end
end

class Ship

  attr_reader :length

  def initialize(length)
    #Initializes ship properties and sets size of ship
    @length = length
    @placed = false
    @hit_counter = 0
  end

  def place(x, y, across)
    #Places a ship on the board
    return false if @placed
    @placed = true
    @across = across
    @x = x
    @y = y
  end

  def covers?(x, y)
    #Checks if ship occupies a given space
    @across ? (@x..@x+@length-1).include?(x) && @y == y : (@y..@y+@length-1).include?(y) && @x == x
  end

  def overlaps_with?(other_ship)
    #Checks if two ships overlap
    if @across
      (@x..@x+length-1).each do |i|
        if other_ship.covers?(i, @y)
          return true
        end
      end
    else
      (@y..@y+length-1).each do |i|
        if other_ship.covers?(@x, i)
          return true
        end
      end
    end
    false
  end

  def fire_at(x, y)
    #Increments hit_counter on successful hits
    if covers?(x, y)
      @hit_counter += 1
      true
    else
      false
    end
  end

  def sunk?()
    #Checks if ships has been hit max number of times
    @length == @hit_counter
  end

end

class Position

  attr_accessor :occupied, :fired_at

  def initialize()
    #Sets default properties of Position
    @occupied = false
    @fired_at = false
  end

end


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
