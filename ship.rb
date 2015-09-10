class Ship
  attr_accessor :length # => 3
  attr_accessor :coverage # => [[1,1], [1,2], [1,3], [1,4]]
  attr_accessor :shots_received # => [[1,1], [1,2], [1,3], [1,4]]

  def initialize(length)
    @length = length
    @coverage = nil
    @shots_received = []
    @coverage = []
  end

  def find_coverage(x, y, across)
    potential_coverage = []
    across ? (x...x+@length).each { |xpos| potential_coverage << [xpos, y] } : (y...y+@length).each { |ypos| potential_coverage << [x, ypos] }
    return potential_coverage
  end

  def place(x, y, across)
    return false unless @coverage.empty?
    @coverage = find_coverage(x, y, across)
    true
  end

  def covers?(x,y)
    return true if @coverage.include?([x,y])
  end

  def overlaps_with?(other_ship)
    intersection = other_ship.coverage & @coverage || []
    intersection.empty? ? (return false) : (return true)
  end

  def fire_at(x,y)
    if @coverage.include?([x,y])
      @shots_received << [x,y] unless @shots_received.include?([x,y])
      return true
    end
  end

  def sunk?
    return false if @coverage.empty?
    (@coverage - @shots_received).empty?
  end


end
