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
    @positions = []
    puts @positions.to_s
    @col_start = col_start
    @row_start = row_start
    count = 0
    #going across
    if orientation == true
      while count < @length
        x = @col_start + count
        y = @row_start
        @positions << Position.new(x, y)
        count += 1
      end
    #going down
    else
      while count < @length
        x = @col_start
        y = @row_start + count
        @positions << Position.new(x, y)
        count += 1
      end
    end
    return true while @positions.length <= @length
    puts @positions.length.to_s
  end

  def covers?(col, row)
    covers = [col, row].to_s
    @positions.to_s.include?(covers)
  end

  def overlaps_with?(another_ship)
    true if another_ship.covers?(@positions.to_s.any?)
  end
end
