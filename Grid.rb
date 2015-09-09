class InvalidGridSizeError < RuntimeError
end
class InvalidShipPlacement < RuntimeError
end


class Grid
  attr_accessor :size
  attr_accessor :ships
  attr_accessor :board

#     1   2   3   4   5   6   7   8   9   10
#   -----------------------------------------
# A |   |   |   |   |   |   |   |   |   |   |
# B |   |   |   |   |   |   |   |   |   |   |
# C |   |   |   |   |   |   |   |   |   |   |
# D |   |   |   |   |   |   |   |   |   |   |
# E |   |   |   |   |   |   |   |   |   |   |
# F |   |   |   |   |   |   |   |   |   |   |
# G |   |   |   |   |   |   |   |   |   |   |
# H |   |   |   |   |   |   |   |   |   |   |
# I |   |   |   |   |   |   |   |   |   |   |
# J |   |   |   |   |   |   |   |   |   |   |
#   -----------------------------------------

  def index_value(x,y)
    ys = ('A'..'ZZ').to_a
    return "#{ys[y-1]}#{x}"
  end

  def initialize(size = [9,9])
    # Validate if the user supplied whole numbers, an array containing 2 numbers,
    # and that it is no larger than 701 (a bit ridiculous anyway) since 701 is the
    # largest y-axis value ZZ. Can you imagine, "Fire at GX308", "Miss", "Shit".
    if size[0].class == FixNum && size[1].class == FixNum && size.size == 2 \
        && size[1] < 702 && size[0] < 702
      @size = size
    else
      raise InvalidGridSizeError, "Cannot create a grid of #{size} size."
    end
    ys = ('A'..'ZZ').to_a
    ('A'.ys[size[1]]).each do |letter|
      (1..size[0]).each do |number|
        @board["#{letter}#{number}".to_sym] = " "
      end
    end
  end

  def place_ship(ship, x, y, across)
    raise InvalidShipPlacement, "Ship already placed on grid" if @ships.include?(ship)
    position = self.index_value(x,y)

    @ships.each do |ship|
      if ship
    end
      raise InvalidShipPlacement, "Ship already occupies this spot"
    @ships << ship
  end

  def has_ship_on?(x,y)
    #TODO
  end

  def display
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def fire_at(x,y)
    #TODO
  end

  def sunk?
    #TODO
  end

end
