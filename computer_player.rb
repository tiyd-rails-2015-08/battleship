require './player'

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
    @grid = Grid.new()
  end
end
