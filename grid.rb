class Grid
  def initialize
    @ships = []
    @hits  = []
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return true if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any?{ |s| s.overlaps_with?(ship)}
      @ships << ship
    else
      false
    end
  end

  def display
    puts     "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    10.times do |y|
      output = "#{letters[y]} |"
      10.times do |x|
        if self.has_ship_on?(x+1, y+1)
          output += " O |"
        elsif @hits.include?([x+1, y+1])
          output += " X |"
        else
          output += "   |"
        end
      end
      puts output
    end
    puts "  -----------------------------------------"
  end

  def fire_at(x, y)
    if has_ship_on?(x, y)
      unless @hits.include?([x, y])
      @hits << [x, y]
      return true
    else
      false
    end
  end
end
end

x_grid = Grid.new
puts x_grid.display
