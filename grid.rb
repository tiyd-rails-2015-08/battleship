class Grid
  def initialize
    @ships = []

  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    overlap = false
    @ships.each do |s|
      if ship.overlaps_with? (s)
        overlap = true
      end
    end
    unless overlap
      @ships << ship
    end
  end

  def display
    puts     "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    (1..10).each do |y|
      output = "#{letters[y-1]} |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        output << if ship && ship.hit_on?(x, y)
                    " X |"
                  elsif ship
                    " O |"
                  else
                    "   |"
                  end
      end
      puts output
    end
    puts "  -----------------------------------------"
  end

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    if ship
      ship.fire_at(x, y)
    else
      false
    end
  end

  def sunk?
    return false if @ships == []
    @ships.all? { |s| s.sunk?}
  end

  def x_of(grid_input)
    x_val = grid_input.match(/\d+/).to_s.to_i
  end

  def y_of(grid_input)
    first_char = grid_input.chars.first
    y_val = first_char.ord - 64
  end
end
