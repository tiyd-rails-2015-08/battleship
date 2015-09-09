require './human_player'
require './computer_player'
require './ship'
require './grid'
require './position'

grid = Grid.new

grid.place_ship(Ship.new(2), 3, 6, true)

puts grid.display
