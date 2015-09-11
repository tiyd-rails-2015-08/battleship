class Position
  attr_reader :x, :y

  # When we want to reference a Position object's coordinates, we must use ship.positions[i].x and ship.positions[i].y
  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
  end

  def hit?
    @hit
  end

  # if @hit is true, return false so that the program knows that we have already hit this location.  Otherwise set @hit to true.
  def hit!
    if @hit
      return false
    else
      @hit = true
    end
  end
end
