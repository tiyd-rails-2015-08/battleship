require './ship.rb'
class Grid
  def initialize
    @ships = []
  end

  def has_ship_on?(x,y)
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
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        line << if ship && ship.hit_on?(x, y)
                  " X |"
                elsif ship
                  " O |"
                else
                  "   |"
                end
      end
      puts line
    end
    display_line
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

    @ships.all? {|s| s.sunk?}

  end

  def x_of(grid_square)
    grid_square.slice(1..grid_square.length).to_i
  end

  def y_of(grid_square)
    letter = grid_square.slice(0)
    letter.ord - "A".ord+1
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
    # puts "    " + (1..10).to_a.join("   ")
  end

  private def display_line
    puts "  -----------------------------------------"
  end

end
