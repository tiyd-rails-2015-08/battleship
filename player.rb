def get_user_input
  gets.chomp
end

require './ship'
require './grid'
require './position'


class Player
  attr_accessor :name
  attr_accessor :grid
  attr_accessor :ships
  attr_accessor :shots_fired

  def initialize
    @ships = []
    @shots_fired = []
  end

end
