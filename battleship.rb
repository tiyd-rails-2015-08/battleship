require './human_player'
require './computer_player'
require './ship'
require './grid'
require './position'

def get_user_input
  gets.chomp
end

ships = []
ships << Ship.new(2)
ships << Ship.new(5)

puts "#{@name}, where would you like to place a ship of length #{@ships[0].@length}?"
