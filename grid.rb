require './ship.rb'

class Grid
  def initialize
    @ships = []
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
      end
    end
    @ships << ship
  end

  def display
    letters = ["A |", "B |", "C |", "D |", "E |", "F |", "G |", "H |", "I |", "J |"]
    j = "   |"
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"

    10.times do |i|
      print letters[i]
      10.times do
        #if ship is there
        #  print " O |"
        #else
        print j
      end
      puts ""
    end
    puts "  -----------------------------------------"
  end

end

#10.times do
  #if ship is there
  #  print " O |"
  #else
#  print "   |"
