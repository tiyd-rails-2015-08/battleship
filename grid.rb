class Grid

attr_reader :miss

  def initialize
    @ships = []
    @ship_coords = []
    @miss = []
  end

  def display
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        line << if ship && ship.hit_on?(x, y)
                    " X |"
                elsif has_ship_on?(x, y)
                    " O |"
                else
                    "   |"
                end
      end
      puts line
    end
      puts "  -----------------------------------------"
  end

  def place_ship(ship, x, y, horizontal)
    ship.place(x, y, horizontal)
    overlap = false
    @ships.each do |s|
        if ship.overlaps_with?(s)
          overlap = true
        end
    end
    unless overlap
      @ships << ship
    end
  end

  def has_ship_on?(x, y)
    # Loops over all ships to check if the coordinate (x, y) is in @positions array of any of them
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
     ship = has_ship_on?(x, y)
    if ship
      ship.fire_at(x, y)
    else
      if !has_ship_on?(x, y) && !@miss.include?([x, y])
        @miss << [x, y]
        return false
      else
        return true
      end
      return false
    end
  end

  def sunk?
    @ships != [] ? @ships.all? { |ship| ship.sunk? } : false
  end

  def x_of(input)
    input.slice(1..input.length).to_i
  end

  def y_of(input)
      letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
      y = input[0]
      letters.each_with_index do |k, index|
        if y == k
          return (index + 1)
        end
      end
  end

end
