<<<<<<< HEAD
require './grid'

=======
>>>>>>> 0ecbbb936b6773e8051a3693c5f60bb9189cef59
class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    @positions = []
    @hits = []
  end

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
    @positions.any? {|p| other_ship.covers?(p[0],p[1])}

<<<<<<< HEAD
    # @positions.each do |place|
    #   return true if other_ship.covers?(place[0], place[1])
=======
    # @positions.each |place|
    #   return true if other_ship.covers?(place[0],place[1])
>>>>>>> 0ecbbb936b6773e8051a3693c5f60bb9189cef59
    # end
    # false
  end

  def fire_at(x, y)
    if covers?(x, y) && !@hits.include?([x, y])
<<<<<<< HEAD
    @hits << [x, y]
=======
      @hits << [x, y]
>>>>>>> 0ecbbb936b6773e8051a3693c5f60bb9189cef59
    end
  end

  def sunk?
    @hits.length == @length
  end

  def hit_on?(x, y)
    @hits.include?([x, y])
  end
<<<<<<< HEAD

=======
>>>>>>> 0ecbbb936b6773e8051a3693c5f60bb9189cef59
end
