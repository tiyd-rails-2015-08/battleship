require './ship'

class Grid
  def initialize
    @ships = []
    @hits = []
    @shots_fired = []
  end

  def has_ship_on?(x,y)
    @ships.each do |ship|
      return true if ship.covers?(x,y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x,y,across)

    # unless @ships.any? { |s| @ships.overlaps_with?(ship)}
    #   @ships << ship
    # end

    @ships.each do |s|
      if ship.overlaps_with?(s)
        return false
      else
        true
      end
    end
    @ships << ship
  end

  # def fire_at(x,y)
  #   if @shots_fired.include?([x,y])
  #     return false
  #   elsif !has_ship_on?(x,y)
  #     return false
  #   else
  #     @shots_fired << [x,y]
  #     return true
  #   end
  # end
  def fire_at(x,y)
    if has_ship_on?(x,y) && !@hits.include?([x,y])
      @hits << [x,y]
    end
  end

  def display

    letters = ["A","B","C","D","E","F","G","H","I","J"]
  puts "    1   2   3   4   5   6   7   8   9   10"
  puts "  -----------------------------------------"
    (1..10).each do |y|
      output_row="#{letters[y-1]} |"
      (1..10).each do |x|
        if @hits.include?([x,y])
          output_row += " X |"
        elsif self.has_ship_on?(x,y)
          output_row += " O |"
        else
          output_row += "   |"
        end
      end
      puts output_row
    end
    puts "  -----------------------------------------"

  end





end
