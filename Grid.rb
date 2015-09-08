class Grid
  attr_accessor :size
  attr_accessor :ships

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
    ys = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    return "#{ys[y-1]}#{x}"
  end

  def initialize(size = [9,9])
    @size = size
  end

  def place_ship(ship)
    #TODO
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
