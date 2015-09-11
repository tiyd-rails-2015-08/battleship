def get_user_input
  gets.chomp
end

class ComputerPlayer < Player
 attr_reader :grid, :name, :ships, :computer_shot

 def initialize
   @grid = Grid.new
   @name = "HAL 9000"
   @ships = []
   @computer_shot = []
 end

 def random
   rand(0..9)
 end

 def call_shot
   @computer_shot = ["A", 1]
 end

 def place_ships(ship_length = [2, 3, 3, 4, 5])
     counter = 0
     loop do |s|
       s = ship_length[counter]
       ship = Ship.new(s)
       x = random
       y = random
       across = true
       if @grid.place_ship(ship, x, y, across)
         counter = counter + 1
         @ships << ship
         break if @ships.length == ship_length.length
       end
     end
   puts "#{@name} has placed its ships."
  end



end
