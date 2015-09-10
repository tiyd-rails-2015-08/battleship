
class ComputerPlayer < Player
 attr_reader :grid

 def initialize
   @grid = Grid.new
 end
 
 def name
   "HAL 9000"
 end

end
