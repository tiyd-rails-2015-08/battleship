class Player
  attr_accessor :name
  attr_accessor :grid

  def initialize(name)
    @name = name
    @grid = Grid.new()
  end

  def place_ships(array_of_ships)
    #TODO
  end

  def call_shot(position)
    #TODO
  end

end
