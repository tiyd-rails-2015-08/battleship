require './ship'

class Grid
  def initialize
    @ships = []
    @positions = []
    @hits = []
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return true if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships.each do |other_ship|
      if ship.overlaps_with?(other_ship)
        return false
      else
        true
      end
    end
    @ships << ship
  end

  def display
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

    #puts ""
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"

    10.times do |y|
      output_row = "#{letters[y]} |"
      #This stuff happens once per row
      # game_block = "|   "
      10.times do |x|
        if @hits.include?([x+1, y+1])
          output_row += " X |"
        elsif self.has_ship_on?(x+1, y+1)
          output_row += " O |"
        else
          output_row += "   |"
        #This stuff happens once per position
        end

      end
      puts output_row
    end
  puts "  -----------------------------------------"
  end

  def fire_at(x, y)
    if has_ship_on?(x, y) && !@hits.include?([x, y])
    @hits << [x, y]
    end
  end

end
