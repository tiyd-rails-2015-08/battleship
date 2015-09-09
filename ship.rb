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

  def overlaps_with?(other_ship)
    #Checks if two ships overlap
    if @horizontal
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
    has_been_hit = Array.new
    if !has_been_hit.include?([x, y])
      if covers?(x, y)
        @hit_counter += 1
        has_been_hit << [x, y]
        true
      else
        false
      end
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
