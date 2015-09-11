require './player'

class HumanPlayer < Player
  attr_reader :name

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
  end
end
