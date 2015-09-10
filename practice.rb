class Player

  attr_reader :name

end

#require './player'
class HumanPlayer < Player

  def initialize(name = "Dave")
    @name = name
  end

end

#require './player'
class ComputerPlayer < Player

  def initialize
    @name = "HAL 9000"
  end

end

#require './ship' into battleship.rb file
class Ship

  attr_reader :length

  def initialize(length)
    @length = length
    @positions = []
  end

  def place(x, y, across)
    return false unless @positions.empty?
    #the above will exit the method if not empty, refuting double placement
    if across
      (x...x+@length).each do |i|
        @positions << [i, y]
      end
    else
      (y...y+@length).each do |j|
        @positions << [x, j]
      end
    end
    true
  end

  def covers?(x, y)
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |coordinate|
      return true if other_ship.covers?(coordinate[0], coordinate[1])
    end
  false
  end

end

class Grid

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships.each do |s|
      if ship.overlaps_with?(s)
        return false
      end
    end
      @ships << ship
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -------------------------------------------"
  end

#the below should be on the Ship class
  def hit_on?(x, y)
    @hits.include([x, y])
  end

#back to Grid class

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    if ship
      ship.fire_at(x, y)
    else
      false
    end
  end

  def display
    #outputs game grid to the user
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i + 1
      line = l + " |"
      (1..10).each do |x|
        ship = hash_ship_on?(x, y)
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

  def sunk?
    return false if @ships == []
    @ships.each do |s|
      return false unless s.sunk?
    end
    true
  end

  #   grid_occupied = false #sentinal variable prevents against empty game saying you won!
  #   (1..100).each do |i|
  #     if @locations[i].occupied
  #       grid_occupied = true
  #       return false unless @locations[i].fired_upon
  #     end
  #   end
  #   grid_occupied
  # end
#
#     y = 0
#     print " "
#     (1..10).each do |i|
#       print "   #{i}"
#     end
#     puts
#     print "  "
#     puts "-"*41
#     ("A".."J").each do |letter|
#       print "#{letter}"
#       print " "
#       y += 1
#       (1..10).each do |x|
#       #while printing the below, check for status of positions
# #        has_ship_on?(x, y) ? (print "| O ") : (print "|   ")
#         if (has_ship_on?(x, y) && @locations[get_position(x,y)].fired_upon == false)
#           (print "| O ")
#         elsif (has_ship_on?(x, y) && @locations[get_position(x,y)].fired_upon == true)
#           (print "| X ")
#         else
#           (print "|   ")
#         end
#       end
#       puts "|"
#     end
#     print "  "
#     puts "-"*41
#   end


    #     #prevent double placement of ships
    # if across
    #   (x...x+ship.length).each do |i|
    #     return false if has_ship_on?(i, y)
    #   end
    # else
    #   (y...y+ship.length).each do |i|
    #     return false if has_ship_on?(x, i)
    #   end
    # end
    # #use place method from ship to get information
    # ship.place(x, y, across)
    # #go through ship coordinates and mark each position as occupied
    # ship.positions.each do |coordinates|
    #   @locations[get_position(coordinates[0], coordinates[1])].occupied = true
    # end
    #
  # end


end
