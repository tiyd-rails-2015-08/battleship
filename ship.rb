class Ship
  @@ys = ('A'..'ZZ').to_a
  attr_accessor :length
  attr_accessor :coverage # ["A1", "B1", "C1"]
  attr_accessor :shots_received

  def initialize(length)
    @length = length
    @coverage = nil
    @shots_received = []
  end

  def grid_value(x,y)
    return "#{@@ys[y-1]}#{x}".to_sym
  end

  def place(x, y, across)
    return false if @coverage
    @coverage = []
    if across
      coverage_x = (x..x+@length-1).to_a
      coverage_x.each { |xpos| @coverage.push(self.grid_value(xpos, y)) }
    else
      coverage_y = (y..y+@length-1).to_a
      coverage_y.each { |ypos| @coverage.push(self.grid_value(x, ypos)) }
    end
    #puts "Coverage: #{@coverage}, #{@coverage == nil}"
    return true
  end

  def covers?(x,y)
    #puts "Checking [#{x}, #{y}]"
    return true if @coverage.include?(self.grid_value(x,y))
    return false
  end

  def overlaps_with?(other_ship)
    intersection = []
    intersection = other_ship.coverage & @coverage
    # puts "My ship coverage: #{@coverage}"
    # puts "Other ship coverage: #{other_ship.coverage}"
    # puts "Intersections: #{intersection}"
    intersection == [] ? (return false) : (return true)
  end

  def fire_at(x,y)
    shot = grid_value(x,y)
    if @coverage.include?(shot)
      @shots_received << shot unless @shots_received.include?(shot)
      return true
    end
    return false
  end

  def sunk?
    return false unless @coverage
    if @coverage - @shots_received == []
      return true
    end
    return false
  end


end
