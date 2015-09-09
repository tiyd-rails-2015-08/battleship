class Ship
  attr_reader :length

  def initialize(length)
    @length = length
    @already_placed = false
    @hit = []
    @positions = []
  end

  # def place(x, y, horizontal)
  #   # places ship on board
  #   return false if @placed
  #   @placed = true
  #   @horizontal = horizontal
  #   @x = x
  #   @y = y
  # end

  def place(x, y, horizontal)
    # This method returns true or false for if the coordinates are in the positions array.
    return false unless @positions.empty?
    if horizontal
      (x...x + @length).each do |i|
        @positions << [i, y]
      end
    else
      (y...y + @length).each do |j|
        @positions << [x, j]
      end
    end
  end

  def covers?(x, y)
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0], place[1])
    end
    false
  end

  # def covers?(x, y)
  #   # returns true or false for if a ship occupies a given space x, y
  #   @horizontal ? (@x...@x+@length).include?(x) && @y == y : (@y...@y+@length).include?(y) && @x == x
  # end

  # def overlaps_with?(other_ship)
  #   #Checks if two ships overlap
  #   if @horizontal
  #     (@x...@x+length).each do |i|
  #       if other_ship.covers?(i, @y)
  #         return true
  #       end
  #     end
  #   else
  #     (@y...@y+length).each do |i|
  #       if other_ship.covers?(@x, i)
  #         return true
  #       end
  #     end
  #   end
  #   false
  # end

  def fire_at(x, y)
    # Pushes x, y coordinates into @hit array if covers? the coordinates has a ship on it (true).
    if covers?(x, y) && !@hit.include?([x, y])
      @hit << [x, y]
    end
  end

  # def fire_at(x, y)
  #   # Increments hit_counter on successful hits
  #   if !@positions.include?([x, y])
  #     if covers?(x, y)
  #       @hit_counter += 1
  #       @positions << [x, y]
  #       true
  #     else
  #       false
  #     end
  #   else
  #     false
  #   end
  # end

  def sunk?
    @hit.length == @length
  end
end
