class Ship
  attr_reader :length, :hit

  def initialize(length)
    @length = length
    @already_placed = false
    @hit = []
    @positions = []
  end

  def place(x, y, horizontal)
    # Checking for the place you want to put the ship to see if it is open.
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
    # This method returns true or false for if the ship is covering these positions in the @positions array.
    # If the place method returns true, they are covering these positions (the coordinates have been stored)
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.any? { |place| other_ship.covers?(place[0], place[1])}
  end

  def fire_at(x, y)
    # Checking if the coordinate x, y can be hit.  If true, it adds coordinate to the @hit array.
    # Pushes x, y coordinates into @hit array if covers? the coordinates has a ship on it is (true).

    if covers?(x, y) && !@hit.include?([x, y])
      @hit << [x, y]
    end
  end

  def sunk?
    @positions != [] && @hit.length >= @length
  end

  def hit_on?(x, y)
      @hit.include?([x, y])
  end

  def miss_on?(x, y)
    @miss.include?([x, y])
  end

end
