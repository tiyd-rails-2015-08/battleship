require './player'

class ComputerPlayer < Player
  attr_reader :name
  def initialize
    @name = "HAL 9000"
  end

  # def name
  #   "HAL 9000"
  # end
  
end
