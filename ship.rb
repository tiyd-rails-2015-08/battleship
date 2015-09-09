require './position.rb'

class Position
  def initialize(col, row)
    @col = col
    @row = row
    @positions = [col, row]
  end

  def is_occupied?
  end

  def hit?
  end
end

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
      end
    #going down
    else
      while count < @length
        @positions << Position.new(@col_start , @row_start + count)
        count += 1
      end
    end
    puts @positions
    if @length = @positions.length
      return true
    end
    puts @positions.length
  end

  def covers?(col, row)
    @col = col
    @row = row
    covers = [@col, @row]
    if @positions.include?(covers)
      return true
    end
    #covers = @col, @row)
  end
end

ship = Ship.new(4).place(2, 1, true)



#   def places
#     if orientation
#       (@col_start...(@col_start + @length)).each do |i|
#         @positions << Position.new(i, @row_start)
#     else
#       (@col_start...(@col_start + @length)).each do |i|
#         @positions << Position.new(@col_start, i)
#       end
#     end
#
# end



  #   (@col_start = )
  #   @col_start = col_start
  #   @row_start = row_start
  #   (@col_start...).each { }
  #   i = 0
  #   (@col_start...@col_start+ship.length) do |i|
  #     @positions << Position.new(@col_start + i, @row_start)
  #   end
  # end



  # @positions = []
  # @positions << position.new(@col_start, 1)
  # @positions << position.new(@col_start + 1, 1)
  # @positions << position.new(@col_start + 2, 1)
  # @positions << position.new(@col_start + 3, 1)
