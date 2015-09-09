require './position.rb'

class Ship
  def initialize(length)
    @length = length
  end

  def length()
    @length
  end

  def col_start
    @col_start
  end

  def row_start
    @row_start
  end

  def place(col_start, row_start, orientation)
    @ship_occupies = []
    @positions = []
    @col_start = col_start
    @row_start = row_start
    count = 0
    #going across
    if orientation == true
      while count < @length
        x = @col_start + count
        y = @row_start
        @ship_occupies << [x, y]
        @positions << Position.new(x, y)
        count += 1
        #puts @positions.to_s
        puts @ship_occupies.to_s
      end
    #going down
    else
      while count < @length
        x = @col_start
        y = @row_start + count
        @ship_occupies << [x, y]
        @positions << Position.new(x, y)
        count += 1
        puts @ship_occupies.to_s
      end
    end
    return true while @positions.length <= @length
    puts @positions.length.to_s
  end

  def covers?(col, row)
    covers = [col, row].to_s
    @ship_occupies.to_s.include?(covers)
  end

  # def overlaps_with?(another_ship)
  #   true if ship.to_s.covers?.any? { |x| another_ship.covers?.include?(x) }
  # end
end


first_ship  = Ship.new(3)
first_ship.place(2, 1, true)
puts first_ship.covers?(3, 1)
puts first_ship.covers?(5, 3)
second_ship = Ship.new(4)
