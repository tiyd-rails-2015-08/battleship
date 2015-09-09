class Ship

  attr_reader :length

  def initialize(length)
    @length = length
    @positions = []
  end

  def place(x, y, across)
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
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |coordinate|
      return true if other_ship.covers?(coordinate[0], coordinate[1])
    end
    false
  end

  # def fire_at(x, y)
  #   #Increments hit_counter on successful hits
  #   if covers?(x, y)
  #     @hit_counter += 1
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def sunk?()
  #   #Checks if ships has been hit max number of times
  #   @length == @hit_counter
  # end

end
