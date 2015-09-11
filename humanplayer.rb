def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  attr_reader :name, :grid, :ships

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(length_array = [2, 3, 3, 4, 5])
    counter = 0
    loop do |s|
      s = length_array[counter]
      ship = Ship.new(s)
      puts "#{@name}, where would you like to place a ship of length #{s}?"
      input = get_user_input
      x = @grid.x_of(input)
      y = @grid.y_of(input)
      puts "Across or Down?"
      input = get_user_input
      if input == "Across"
        horizontal = true
      elsif input == "Down"
        horizontal = false
      end
      if @grid.place_ship(ship, x, y, horizontal)
        counter = counter + 1
        @ships << ship
        if @ships.length == length_array.length
          break
        end
      else
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
      end
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):\n"
    input = get_user_input
    x = @grid.x_of(input).to_s
    y = @grid.y_of(input).to_s
    x + y
  end

  def display
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = @grid.has_ship_on?(x, y)
        line << if ship && ship.hit_on?(x, y)
                    " + |"
                elsif grid.miss.include?([x, y])
                    " - |"
                else
                    "   |"
                end
      end
      puts line
    end
      puts "  -----------------------------------------"
  end
end
