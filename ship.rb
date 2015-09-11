require './position'

class Ship
  attr_reader :length, :positions, :hits

  def initialize(length)
    @length = length
    @positions = []
  end

  def place(x, y, across)
    # If nothing is in positions, abort method.
    return false unless @positions.empty?
    # If across... duh this is an easy part
    if across
      # For range of x through x plus length of ship, create a new Position object and place it in the positions array.
      (x...x+length).each do |i|
        @positions << Position.new(i, y)
      end
      # And do the same thing in the other direction if across == false
    else
      (y...y+length).each do |i|
        @positions << Position.new(x, i)
      end
    end
  end

  def covers?(x, y)
    # For each Position object in the positions array, check to see if the x and y objects equal any positions listed there.
    @positions.each do |place|
      return place if place.x == x && place.y == y
    end
    false
  end

  def overlaps_with?(other_ship)
    # Check positions and return true if any of other_ship's coordinates are already inside positions.
    @positions.any? {|p| other_ship.covers?(p.x, p.y)}
  end

  def fire_at(x, y)
    # Check to see if x and y are covered in any existing Position objects and whether hits has a record of a hit.
    # Set hit on Position object if one is not already recorded.
    position = covers?(x, y)
    position && position.hit!
  end

  def hit_on?(x, y)
    # Check to see if x and y are covered in any existing Position objects and if there is a hit recorded.
    position = covers?(x, y)
    position && position.hit?
  end

  def sunk?
    # Sink ship if hits are greater than or equal to the length of the ship.
    !@positions.empty? && @positions.all? {|p| p.hit?}
  end
end
