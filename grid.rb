require './ship'

class Grid
  def initialize
    @ships = []
    @positions = []
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

    10.times do |i|
      output_row = "#{letters[i]} |"
      #This stuff happens once per row
      # game_block = "|   "
      10.times do
        output_row += "   |"
        #This stuff happens once per position

      end
      puts output_row
    end
  puts "  -----------------------------------------"
  end

end
