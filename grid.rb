require "./ship"

class Grid
  attr_reader :ships, :hits

  def initialize
    @ships = []
    @hits = []
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any?{|s| ship.overlaps_with?(s)}
      @ships << ship
    else
      false
    end
  end

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    if ship
      ship.fire_at(x, y)
    else
      false
    end
  end

  def display
    e_coord = "   |"
    o_coord = " O |"
    h_coord = " X |"
    left_col = ["A |", "B |", "C |", "D |", "E |", "F |", "G |", "H |", "I |", "J |"]
    puts "    1   2   3   4   5   6   7   8   9   10"
    print "  -----------------------------------------"
    10.times do |a|
      print "\n"
      print left_col[a]
      10.times do |b|
        if has_ship_on?(b+1, a+1) && @ships.any?{ |s| s.hit_on?(b+1, a+1) }
          print h_coord
        elsif has_ship_on?(b+1, a+1)
          print o_coord
        else
          print e_coord
        end
      end
    end
    puts "\n  -----------------------------------------"
  end

  def sunk?
    return false if @ships == []
    @ships.all?{|ship| ship.sunk?}
  end

  def x_of(input)
    input.slice(1..input.length).to_i
  end

  def y_of(input)
    letter = input.slice(0)
    letter.ord-"A".ord+1
  end

end
