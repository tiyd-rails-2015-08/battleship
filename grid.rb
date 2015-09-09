class Grid

  def initialize
    #@ships = []
    #creates new array with 100 Position objects
    @locations = Array.new(100)
      (1..100).each do |i|
      #set each object in the array to a new position, referencing position class
      @locations[i] = Position.new
    end
  end

  private def get_position(x, y)
    #converts x,y coordinates to corresponding array index of positions
    x + (y-1) * 10
  end

  def has_ship_on?(x, y)
    #Checks if position is covered
    @locations[get_position(x,y)].occupied
  end

  def place_ship(ship, x, y, across)
    #prevent double placement of ships
    if across
      (x...x+ship.length).each do |i|
        return false if has_ship_on?(i, y)
      end
    else
      (y...y+ship.length).each do |i|
        return false if has_ship_on?(x, i)
      end
    end
    #use place method from ship to get information
    ship.place(x, y, across)
    #go through ship coordinates and mark each position as occupied
    ship.positions.each do |coordinates|
      @locations[get_position(coordinates[0], coordinates[1])].occupied = true
    end
    #@ships << ship
  end

  def fire_at(x, y)
    if (1..10).include?(x) && (1..10).include?(y)
      if @locations[get_position(x,y)].fired_upon
        #checks if location has been fired at previously
        return false
      else
        #marks location as already_hit and checks for a hit
        @locations[get_position(x,y)].fired_upon = true
        has_ship_on?(x, y)
      end
    else
      false
    end
  end

  def display()
    #outputs game grid to the user, define empty grid
    y = 0
    print " "
    (1..10).each do |i|
      print "   #{i}"
    end
    puts
    print "  "
    puts "-"*41
    ("A".."J").each do |letter|
      print "#{letter}"
      print " "
      y += 1
      (1..10).each do |x|
      #while printing the below, check for status of positions
        has_ship_on?(x, y) ? (print "| O ") : (print "|   ")
      end
      puts "|"
    end
    print "  "
    puts "-"*41
  end

#   def empty_grid
#   #TO DO: change into a loop inside a loop to display the below
#     %Q{    1   2   3   4   5   6   7   8   9   10
#   -----------------------------------------
# A |   |   |   |   |   |   |   |   |   |   |
# B |   |   |   |   |   |   |   |   |   |   |
# C |   |   |   |   |   |   |   |   |   |   |
# D |   |   |   |   |   |   |   |   |   |   |
# E |   |   |   |   |   |   |   |   |   |   |
# F |   |   |   |   |   |   |   |   |   |   |
# G |   |   |   |   |   |   |   |   |   |   |
# H |   |   |   |   |   |   |   |   |   |   |
# I |   |   |   |   |   |   |   |   |   |   |
# J |   |   |   |   |   |   |   |   |   |   |
#   -----------------------------------------
# }
#   end

end

#

#
#   def sunk?()
#     empty_grid = true
#     (1..100).each do |i|
#       if @locations[i].occupied
#         @locations[i].fired_at ? () : (return false)
#         empty_grid = false
#       end
#     end
#     !empty_grid
#   end
#
#   def x_of
#   end
#
#   def y_of
#   end
#
