require './player.rb'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  def initialize(name = "Dave")
    @name = name
  end

end

puts "#{@name}, where would you like to place a ship of length 2?"

puts "Across or Down?"

puts "#{@name}, where would you like to place a ship of length 5?"

puts "Across or Down?"
