require './grid.rb'

class Player
  attr_reader :name

  def grid
    Grid.new
  end
end
