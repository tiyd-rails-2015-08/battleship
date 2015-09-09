require './player'
# require './position'
require './ship'


class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    @positions = []
  end

  # def place(x, y, across)
  #   @across = across
  #   @x = x
  #   @y = y
  # end
  #
  # def covers?(x, y)
  #   @across ? (@x..@x+@length-1).include(x) && @y == y : (@y..@y+@length).include?(y) && @x == x
  # end

  def place(x, y, across)
    return false unless @positions.empty?
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
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0],place[1])
    end
    false
  end

  def fire_at(x, y)
    covers?(x, y)
  end
end
