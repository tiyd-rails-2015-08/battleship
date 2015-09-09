class InvalidGridSizeError < RuntimeError
end
class InvalidShipPlacement < RuntimeError
end


class Grid
  @@ys = ('A'..'ZZ').to_a
  attr_accessor :size
  attr_accessor :ships
  attr_accessor :board
  attr_accessor :shots_fired

  def grid_value(x,y)
    return "#{@@ys[y-1]}#{x}".to_sym
  end

  def initialize(size = [10,10])
    # Validate if the user supplied whole numbers, an array containing 2 numbers,
    # and that it is no larger than 701 (a bit ridiculous anyway) since 701 is the
    # largest y-axis value ZZ. Can you imagine, "Fire at GX308", "Miss", "Shit".
    if size[0].class == Fixnum && size[1].class == Fixnum && size.size == 2 \
        && size[1] < 702 && size[0] < 702
      @size = size
    else
      raise InvalidGridSizeError, "Cannot create a grid of #{size} size."
    end
    @board = {}
    ('A'..@@ys[size[1]-1]).each do |letter|
      (1..size[0]).each do |number|
        @board["#{letter}#{number}".to_sym] = " "
      end
    end
    @ships = []
    @shots_fired = []
  end

  def place_ship(ship, x, y, across)
    #raise InvalidShipPlacement, "Ship already placed on grid" if @ships.include?(ship)
    #raise InvalidShipPlacement, "Ship already occupies this spot" if self.has_ship_on?(x, y)
    return false if @ships.include?(ship)
    return false if self.has_ship_on?(x, y)

    potential_coverage = []
    if across
      (x..x+ship.length-1).to_a.each { |xpos| potential_coverage << [xpos, y] }
    else
      (y..y+ship.length-1).to_a.each { |ypos| potential_coverage << [x, ypos] }
    end
    potential_coverage.each do |pos|
      return false if self.has_ship_on?(pos[0], pos[1])
    end
    potential_coverage.each do |pos|
      @board[self.grid_value(pos[0],pos[1])] = "O"
    end
    @ships << ship
    ship.place(x, y, across)
  end

  def has_ship_on?(x,y)
    position = self.grid_value(x,y)
    @board[position] == "O" ? (return true) : (return false)
  end


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

  def display
    #First Line
    display = " "
    (1..@size[0]).each do |number|
      display.concat("   #{number}")
    end
    display.concat("\n  ")

    #Second Line
    (@size[0]*4).times { display.concat("-") }
    display.concat("-").concat("\n")

    #Add a row for each y axis value
    ('A'..@@ys[@size[1]-1]).each do |letter|
      display.concat("#{letter} |") if letter.length == 1
      display.concat("#{letter}|") if letter.length == 2
      (1..@size[0]).each do |number|
        position = @board["#{letter}#{number}".to_sym]
        display.concat(" #{position} |")
      end
      display.concat("\n")
    end

    #Last line
    display.concat("  ")
    (@size[0]*4).times { display.concat("-") }
    display.concat("-")

    puts display
  end

  def fire_at(x,y)
    position = self.grid_value(x,y)
    return false unless @board.has_key?(position)

    # Record shots, even if they're repeats,
    @shots_fired << [x,y] && (return false) if @shots_fired.include?([x,y])
    @shots_fired << [x,y]

    if self.has_ship_on?(x,y)
      # hits,
      @board[position] = "X"

       # (tell the ship it received fire.)
      shot_ship = nil
      @ships.each do |ship|
        break if shot_ship
        shot_ship = ship if ship.coverage.include?([x,y])
      end
      shot_ship.fire_at(x,y)
    else
      # and misses.
      false
    end

  end

  def sunk?
    return false unless @ships.any? { |ship| ship.sunk? }
    return true
  end

  def x_of(position)
    position.gsub(/[^\d]/, "").to_i
  end

  def y_of(position)
    (@@ys.index(position.gsub(/[^\D]/, "").upcase)+1).to_i
  end

end
