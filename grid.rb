require './ship'
# require './position'

class Grid
  def initialize
    @ships = []
    @grid = []
    @hits = []
    @hits_on_opponent = []
    @misses_on_opponent = []
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any?{|s| s.overlaps_with?(ship)}
      @ships << ship
    else
      false
    end
  end

  def fire_at(x, y)
      ship = has_ship_on?(x,y)
      if ship
      ship.fire_at(x,y)
    else
      false
    end
# if has_ship_on?(x, y) && !@hits.include?([x, y])
#   @hits << [x, y]
#   return true
  end

  # def display
  #   display_header
  #   display_line
  #   ("A".."J").each_with_index do |l, i|
  #     y = i+1
  #     line = l + " |"
  #     (1..10).each do |x|
  #       ship = has_ship_on?(x, y)
  #       line << if ship && ship.hit_on?(x, y)
  #                 " X |"
  #               elsif ship
  #                 " O |"
  #               else
  #                 "   |"
  #               end
  #     end
  #     puts line
  #   end
  #   display_line
  # end

  def display
    display_with_block do |x, y|
      ship = has_ship_on?(x, y)
      if ship && ship.hit_on?(x, y)
        " X |"
      elsif ship
        " O |"
      else
        "   |"
      end
    end
end

def display_shots
    display_with_block do |x, y|
      if @hits_on_opponent.include?([x, y])
        " + |"
      elsif @misses_on_opponent.include?([x, y])
        " - |"
      else
        "   |"
      end
    end
  end

  def display_with_block
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        line << yield(x, y)
      end
      puts line
    end
    display_line
  end


  def miss_opponent(c)
    @misses_on_opponent << [x_of(c), y_of(c)]
  end

  def hit_opponent(c)
    @hits_on_opponent << [x_of(c), y_of(c)]
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end


  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -----------------------------------------"
  end
  #   e_coord = "   |"
  #   o_coord = " O |"
  #   h_coord = " X |"
  #
  #   left_col = ["A |", "B |", "C |", "D |", "E |", "F |", "G |", "H |", "I |", "J |"]
  #   puts"    1   2   3   4   5   6   7   8   9   10"
  #   print"  -----------------------------------------"
  #   10.times do |a|
  #   print "\n"
  #   print left_col[a]
  #   10.times do |b|
  #     if has_ship_on?(b+1, a+1) && @hits.include?([b+1, a+1])
  #       print h_coord
  #     elsif has_ship_on?(b+1, a+1)
  #       print o_coord
  #     else
  #       print e_coord
  #     end
  #   end
  # end
  # puts"\n  -----------------------------------------"
  # end
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
    # convert = { "A" => 1, "B" => 2, "C" => 3,
    #             "D" => 4,"E" => 5, "F" => 6,
    #             "G" => 7,"H" => 8,"I" => 9,"J" => 10,}
    # grab = input.slice(0)
    # answer = grab(convert)
    #end




end
