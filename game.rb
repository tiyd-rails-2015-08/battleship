def get_user_input
  gets.chomp
end

class Game
  def initialize (human, computer)
    @human = human
    @computer = computer
  end

  def game_path
    play_normal_game if @computer == "HAL 9000"

  end
  def welcome
    puts "Welcome, #{@human.name} and #{@computer.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @human.place_ships()
    @computer.place_ships()
  end

  def display_status
    puts "SHOTS TAKEN:"
    @human.display
    puts ""
    puts "YOUR BOARD:"
  @human.grid.display
    # self.place_ships
  end

  def take_turn
  end

end
