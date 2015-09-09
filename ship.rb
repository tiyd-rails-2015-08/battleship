class Ship
  attr_reader :length 
  def initialize(length)
    @length = length
    @positions = []
    @hits = []
  end

  def place(x,y,across)
    return false unless @positions.empty?
    # @across = across
    # @x = x
    # @y = y
    if across
      (x...x+@length).each do |i|
        @positions << [i,y]
      end
    else
      (y...y+@length).each do |j|
        @positions << [x,j]
      end
    end
    true
  end

  def covers?(x,y)
    #@across ? (@x...@x+length).include?(x) && @y == y : (@y...@y+@length).include?(y) && @x ==x
    @positions.include?([x,y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0],place[1])
    end
    false
  end
  def fire_at(x,y)
    if covers?(x,y) && !@hits.include?([x,y])
      @hits << [x,y]
    end
  end

  def sunk?
    @hits.length == @length
  end
end

















#require './position'
# class Position
#   def initialize(x, y)
#     @position = [x, y]
#     @hit = 0
#   end
#
#   def position
#     @position
#   end
#
#   def is_hit
#     @hit
#   end
# end
#
# class Ship
#   def initialize(length)
#     @length = length
#   end
#
#   def length()
#     @length
#   end
#
#   def place(x, y, is_across)
#     i = 0
#     @positions = []
#     if is_across
#       until self.length == i do
#         @positions[i] = Position.new(x, y)
#         i += 1
#         x += 1
#       end
#     else
#       until self.length == i do
#         @positions[i] = Position.new(x, y)
#         i += 1
#         y += 1
#       end
#     end
#     if @positions.length == self.length
#       return true
#     end
#   end
#
#   def positions
#     @positions
#   end
#
#   def covers?(x, y)
#     check = [x, y].to_s
#     position_guts = self.positions
#     position_guts.to_s.include?(check)
#     # @positions.include?(check)
#   end
#
# end

#
# def place (x, y, orientation)
#
#   if orientation
#     (x...x+@ships_length).each do |i|
#       @position << Position.new(i, y)
#     end
#   else
#     (y...y+@ships_length).each do |i|
#       @position << Position.new(x, i)
#     end
#   end
# end
