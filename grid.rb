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

  def sunk?()
    grid_occupied = false
    #above prevents against empty game saying you won!
    (1..100).each do |i|
      if @locations[i].occupied
        grid_occupied = true
        return false unless @locations[i].fired_upon
      end
    end
    grid_occupied
    #above means that if the grid is empty, you didn't win!
  end

  def x_of(grid_spot)
    grid_spot[1..-1].to_i
  end

  def y_of(grid_spot)
    map = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10}
    map[grid_spot[0].to_sym]
  end

  def display()
    #outputs game grid to the user
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
#        has_ship_on?(x, y) ? (print "| O ") : (print "|   ")
        if (has_ship_on?(x, y) && @locations[get_position(x,y)].fired_upon == false)
          (print "| O ")
        elsif (has_ship_on?(x, y) && @locations[get_position(x,y)].fired_upon == true)
          (print "| X ")
        else
          (print "|   ")
        end
      end
      puts "|"
    end
    print "  "
    puts "-"*41
  end

end
