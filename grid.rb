class Grid

  def initialize
    #@ships = []
    @locations = Array.new(100) #creates new array with 100 Position objects
    (1..100).each do |i|
      @locations[i] = Position.new #set each object in the array to a new position, referencing position class
    end
  end

  def get_position(x, y)
    x + (y-1) * 10 #converts x,y coordinates to corresponding array index of positions
  end

  def has_ship_on?(x, y) #Checks if position is covered
    @locations[get_position(x,y)].occupied
  end

  def place_ship(ship, x, y, across)
    if across #prevent double placement of ships
      (x...x+ship.length).each do |i|
        return false if has_ship_on?(i, y)
      end
    else
      (y...y+ship.length).each do |i|
        return false if has_ship_on?(x, i)
      end
    end
    ship.place(x, y, across) #use place method from ship to get information
    ship.positions.each do |coordinate| #go through ship coordinates and mark each position as occupied
      @locations[get_position(coordinate[0], coordinate[1])].occupied = true
    end
    #@ships << ship
  end

  def fire_at(x, y)
    if (1..10).include?(x) && (1..10).include?(y)
      if @locations[get_position(x,y)].fired_upon #checks if location has been fired at previously
        return false
      else
        @locations[get_position(x,y)].fired_upon = true #marks location as already_hit and checks for a hit
        has_ship_on?(x, y)
      end
    else
      false
    end
  end

  def sunk?
    grid_occupied = false #sentinal variable prevents against empty game saying you won!
    (1..100).each do |i|
      if @locations[i].occupied
        grid_occupied = true
        return false unless @locations[i].fired_upon
      end
    end
    grid_occupied
  end

  def x_of(grid_spot)
    grid_spot[1..-1].to_i
  end

  def y_of(grid_spot)
    map = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10}
    map[grid_spot[0].to_sym]
  end

  def display
    display_boat_grid
  end

  def display_shots_grid #outputs game grid to the user
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
      (1..10).each do |x| #while printing the below, check for fired and misses
      if @locations[get_position(x, y)].fired_upon == false
        (print "|   ")
      else @locations[get_position(x, y)].fired_upon == true
        if @locations[get_position(x, y)].occupied == true
          (print "| + ")
        else
          (print "| - ")
        end
      end
      end
      puts "|"
    end
    print "  "
    puts "-"*41
  end

  def display_boat_grid
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
      (1..10).each do |x| #while printing the below, check for status of positions
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
