# require './ship'

class Grid
  def initialize
    @ships = []
    # @positions = []
    # @hits = []
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
    #letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"

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
  puts "  -----------------------------------------"
  end

  def fire_at(x, y)
    # if has_ship_on?(x, y) && !@hits.include?([x, y])
    # @hits << [x, y]
    # end
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

    # @ships.each do |s|
    #   return false unless s.sunk?
    # end
    # true

  def x_of(grid_square)
    grid_square.slice(1..grid_square.length).to_i
  end

  def y_of(grid_square)
    letter = grid_square.slice(0)
    letter.ord - "A".ord + 1
  end

end
