class Ship
  attr_accessor :length
  attr_accessor :coverage
  attr_accessor :x
  attr_accessor :y
  attr_accessor :across

  def initialize(length)
    @length = length
  end

  def place(x,y,across)
    #TODO
  end

  def covers?(x,y)
    #TODO
  end

  def overlaps_with?(ship)
    #TODO
  end

  def fire_at(x,y)
    #TODO
  end

  def sunk?
    #TODO
  end


end
