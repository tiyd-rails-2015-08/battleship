require './player'

class HumanPlayer < Player
  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new()
  end
end
