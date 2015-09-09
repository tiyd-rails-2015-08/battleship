#require ArgumentError < StandardError
class Player
  def initialize (x)
    #@name = name
  end
end

class HumanPlayer < Player
 def initialize(name = "Dave")
   @name = name
 end
 def name
    @name
 end
end

class ComputerPlayer < Player
  def initialize ()
  end
  def name
    "HAL 9000".upcase
  end
end
