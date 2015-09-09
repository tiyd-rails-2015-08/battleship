class Ship
  attr_reader :length


  def initialize(length)
    @length = length
    @already_placed = false
    @hit_counter = 0
  end

  def place(x, y, horizontal)
    # places ship on board
    return false if @placed
    @placed = true
    @horizontal = horizontal
    @x = x
    @y = y
  end

  def covers?(x, y)
    # returns true or false for if a ship occupies a given space x, y
    @horizontal ? (@x..@x+@length-1).include?(x) && @y == y : (@y..@y+@length-1).include?(y) && @x == x
  end

  def overlaps_with?(ship)

  end

  def fire_at(x, y)
    covers?(x, y)
    #if that position_object is marked as placed, change to x
    if
      true
    else
      false
    end
  end

  def sunk?
     @length == @hit_counter
  end

  def has_ship_on?(x, y)

  end

end
