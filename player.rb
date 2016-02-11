def get_user_input
  gets.chomp
end

class Player
  attr_reader :name, :grid

  def initialize(name)
    @name = name
    @grid = Grid.new
  end

  def ships
      @grid.ships
  end

  def display_ocean_grid
  end

  def display_target_grid
  end

  def fire_at_coordinates(coords)
    grid.fire_at_coordinates(coords)
  end

  def record_hit(coords)
    grid.hit_opponent(coords)
  end

  def record_miss(coords)
    grid.miss_opponent(coords)
  end

  def sunk?
    grid.sunk?
  end
end
