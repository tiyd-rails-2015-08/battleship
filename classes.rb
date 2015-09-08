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
    @length = length
    @placed = false
    @hit_counter = 0
  end

  def place(x, y, across)
    return false if @placed
    @placed = true
    @across = across
    @x = x
    @y = y
  end

  def covers?(x, y)
    @across ? (@x..@x+@length-1).include?(x) && @y == y : (@y..@y+@length-1).include?(y) && @x == x
  end

  def overlaps_with?(other_ship)
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
    if self.covers?(x, y)
      @hit_counter += 1
      true
    else
      false
    end
  end

  def sunk?()
    @length == @hit_counter
  end

end

class Position

  attr_accessor :occupied

  def initialize()
    @occupied = false
  end

end


class Grid

  def initialize()
    @locations = Array.new(100)
      (1..100).each do |i|
        @locations[i] = Position.new
      end
  end

  def get_position(x, y)
    x + y * 10
  end

  def has_ship_on?(x, y)
    @locations[get_position(x,y)].occupied
  end

  def place_ship (ship, x, y, across)
    ship.place(x, y, across)
    if across
      (x..x+ship.length-1).each do |i|
      @locations[get_position(i, y)].occupied = true
      end
    else
      (y..y+ship.length-1).each do |i|
      @locations[get_position(x, i)].occupied = true
      end
    end
  end

  def display()
    puts self.empty_grid
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
