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

  def fire_at(x, y)
    if covers?(x, y) && !@hits.include?([x, y])
      @hits << [x, y]
    end
  end

  def sunk?
    @hits.length == @length
  end
end
