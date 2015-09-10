class Position
  attr_accessor :hit
  attr_accessor :x
  attr_accessor :y
  attr_accessor :position

  def initialize(x: nil, y: nil, position: nil, hit: false)
    @x = x
    @y = y
    @position = position
    @hit = hit
  end
end
