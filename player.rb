def get_user_input
  gets.chomp
end

class Player
  attr_reader :name, :grid

  def initialize(name)
    @name = name
    @grid = Grid.new
  end

end
