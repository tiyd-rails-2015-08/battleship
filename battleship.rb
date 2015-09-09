##### CODE FOR TESTS #####

def get_user_input
  gets.chomp
end

class Player

end

class HumanPlayer < Player
  attr_reader :name
  def initialize(name = "Dave")
    @name = name
  end
end

class ComputerPlayer < Player
  attr_reader :name
  def initialize(name: "HAL 9000")
    @name = name
  end
end

class Position
  def initialize(x, y)
    @position = [x, y]
  end
end

class Ship
  attr_reader :length
  def initialize(length)
    @length = length
  end

  def place(x, y, orientation)
    if orientation == true
      true
    else
      false
    end
  end

  def positions
    i = 0
    @positions = []
    if place(orientation) == true
      until self.length == i do
        @positions[i] = Position.new(x, y)
        i += 1
        y += 1
      end
    else
      until self.length == i do
        @positions[i] = Position.new(x, y)
        i += 1
        y += 1
      end
    end
  end

  def covers?(x, y)
    check = [x, y].to_s
    @positions.to_s.include(covers)
  end

  def covers?(x, y)
    if orientation = true
      (x...x+@length).each do |i|
        Position.new(i, y)
      end
    else
      (y...y+@length).each do |i|
        Position.new(x, i)
      end
    end
  end

end
