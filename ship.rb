require './position.rb'

class Ship
  def initialize(length)
    @length = length
  end

  def length()
    @length
  end

  def col_start
    @col
  end

  def row_start
    @row
  end

  def place(col_start, row_start, orientation)
    @positions = []
    @col_start = col_start
    @row_start = row_start
    count = 0
    #going across
    if orientation == true
      while count < @length
        @positions << Position.new((@col_start + count), @row_start)
        count += 1
        puts @positions.to_s
      end
    #going down
    else
      while count < @length
        @positions << Position.new(@col_start , @row_start + count)
        count += 1
      end
    end
    puts @positions[1]
    if @length = @positions.length
      return true
    end
  end

  def covers?(col, row)
    @col = col
    @row = row
    covers = [@col, @row].to_s
    if @positions.to_s.include?(covers)
      return true
    end
  end

end

ship = Ship.new(4).place(2, 1, true)
