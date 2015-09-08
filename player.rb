#require ArgumentError < StandardError
class Player
  def initialize (name)
    @name = name
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
end
