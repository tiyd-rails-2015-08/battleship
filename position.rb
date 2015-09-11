
class Position
attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @hit = 0
  end

  def is_hit
    @hit
  end
end
