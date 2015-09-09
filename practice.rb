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
