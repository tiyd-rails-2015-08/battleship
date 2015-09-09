
class Grid

  def initialize
    @ships = []
    @ship_coords = []
  end

  def display
    y = 0
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    (0..9).each do |row|
      output = "#{letters[row]} |"
      (0..9).each do |column|
        if @ship_coords.include?([column+1, row+1])
          output += " X |"
        elsif has_ship_on?(column+1, row+1)
          output += " O |"
        else
          output += "   |"
        end
      end
      puts output
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
      return true if ship.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
    if !has_ship_on?(x, y)
      return false
    elsif @ship_coords.include?([x, y])
      return false
    elsif
      @ships.each do |i|
        @ships.include?(i.covers?(x, y))
      end
      @ship_coords << [x, y]
      return true
    else
    end
  end

  def sunk?
    return false if @ships.length == 0
    # Loops over all ships to check if sunk? method returns true.
    @ships.reject(&:sunk?).length == 0 # return true when all ships are sunk
  end

  def x_of(input)

  end

  def y_of(input)

  end

end
