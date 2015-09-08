class Player

  attr_reader :name

  def initialize(name = "Dave")
    @name = name
  end

end

class HumanPlayer < Player

end

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
  end
end

class Ship

  attr_reader :length#, :across, :x, :y

  def initialize(length)
    @length = length
    @placed = false
    @hit_counter = 0
  end

  def place(x, y, across)
    return false if @placed
    @placed = true
    @across = across
    @x = x
    @y = y
  end

  def covers?(x, y)
    @across ? (@x..@x+@length-1).include?(x) && @y == y : (@y..@y+@length-1).include?(y) && @x == x
  end

  def overlaps_with?(other_ship)
    if @across
      (@x..@x+length-1).each do |i|
        if other_ship.covers?(i, @y)
          return true
        end
      end
    else
      (@y..@y+length-1).each do |i|
        if other_ship.covers?(@x, i)
          return true
        end
      end
    end
    false
  end

  def fire_at(x, y)
    if self.covers?(x, y)
      @hit_counter += 1
      true
    else
      false
    end
  end

  def sunk?()
    @length == @hit_counter
  end

end
