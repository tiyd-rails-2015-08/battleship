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

  #getting 'undefined variable x' error in my place method.
  #might be an order of operations problem? Not sure how else to put
  #this together.

  def place(horizontal, vertical, orientation)
    place = [x, y]
    hits = 0
      if orientation == true
        true
      else
        false
      end
    end

    def hit
      @hit
    end
  end

  def positions
    @positions
  end

  def covers?(x, y)

end
