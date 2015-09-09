class Ship

  attr_reader :length, :positions, :hits

  def initialize(length)
    @length = length
    @positions = []
    @hits = []
  end

  def place(x, y, across)
    #places the ship on its initial coordinates, sets the direction, stores all coordinates in an array
    return false unless @positions.empty?
    #the above will exit the method if not empty, refuting double placement
    if across
      (x...x+@length).each do |i|
        @positions << [i, y]
      end
    else
      (y...y+@length).each do |j|
        @positions << [x, j]
      end
    end
    true
  end

  def covers?(x, y)
    #checks is ship covers a particular coordinate
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    #checks if self overlaps with other_ship
    @positions.each do |coordinate|
      return true if other_ship.covers?(coordinate[0], coordinate[1])
    end
    false
  end

  def fire_at(x, y)
    #checks if a ship covers a spot, if not yet fired at - allows it to be fired at, adds coordinates to hits array
    if covers?(x, y) && !@hits.include?([x, y])
      @hits << [x, y]
    end
  end

  def sunk?()
   #checks if length of ship equals length of array
    @length == @hits.length
  end

end
