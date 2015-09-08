class Player
  def initialize
  end
end

class HumanPlayer < Player
  def initialize(name = "")
    if name != ""
      @name = name
    else
      @name = "Dave"
    end
  end

  def name
    @name
  end
end

class ComputerPlayer < Player
  def initialize
  end

  def name
    @name = "HAL 9000"
  end
end

class Ship
end
