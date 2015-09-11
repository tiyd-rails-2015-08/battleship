require './grid'

class Player
  attr_reader :name
  def initialize
  end

  grid = Grid.new

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
    @name = "HAL 9000"
  end
end

# optional approach...
# class ComputerPlayer < player
#   def name
#     "HAL 9000"
#   end
# end
