#require './position'
class Position
  def initialize(x, y)
    @position = [x, y]
    @hit = 0
  end

  def position
    @position
  end

  def is_hit
    @hit
  end
end

class Ship
  def initialize(length)
    @length = length
  end

  def length()
    @length
  end

  def place(x, y, is_across)
    i = 0
    @positions = []
    if is_across
      until self.length == i do
        @positions[i] = Position.new(x, y)
        i += 1
        x += 1
      end
    else
      until self.length == i do
        @positions[i] = Position.new(x, y)
        i += 1
        y += 1
      end
    end
    if @positions.length == self.length
      return true
    end
  end

  def positions
    @positions
  end

  def covers?(x, y)
    check = [x, y].to_s
    position_guts = self.positions
    position_guts.to_s.include?(check)
    # @positions.include?(check)
  end

end

#
# def place (x, y, orientation)
#
#   if orientation
#     (x...x+@ships_length).each do |i|
#       @position << Position.new(i, y)
#     end
#   else
#     (y...x+@ships_length).each do |i|
#       @position << Position.new(x, i)
#     end
#   end
# end
