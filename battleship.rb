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

class Ship
  attr_reader :length
  def initialize(length = 4)
    @length = length
  end

  def place(x, y, orientation)
    if orientation == true
      true
    else
      false
    end
  end

  def covers(x, y, orientation)
    if orientation == true
      x + 3
    elsif orientation == false
      y + 3
    end
  end
end
