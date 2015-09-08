#require ArgumentError < StandardError
class Player
  def initialize (name)
    #@name = name
  end
end

class HumanPlayer < Player
 def name
    "Alice"
 end
end

class ComputerPlayer < Player
  def initialize ()
  end
  def name
    "HAL 9000".upcase
  end
end

class Ship
  def initialize (x)

  end
  def length
    4
  end
end
