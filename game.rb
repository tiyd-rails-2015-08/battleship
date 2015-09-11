def get_user_input
  gets.chomp
end

class Game
  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  # def game_path
  #   play_normal_game if @player_two == "HAL 9000"
  # end

  def welcome
    puts "Welcome, #{@player_one.name} and #{@player_two.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @player_one.place_ships()
    @player_two.place_ships()
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player_one.display
    puts ""
    puts "YOUR BOARD:"
  @player_one.grid.display
  end

  def take_turn
    playing = @player_one
    waiting = @player_two
    until @player_one.grid.sunk? || @player_two.grid.sunk?
      playing.call_shot # <= "A1"
      x = waiting.grid.x_of(playing.input)
      y = waiting.grid.y_of(playing.input)
      if waiting.grid.fire_at(x, y)
        puts "Hit!"
      else
        puts "Miss!"
      end
      # player.display_status
      if playing == @player_one
        playing = @player_two
        waiting = @player_one
      else
        playing = @player_one
        waiting = @player_two
      end
    end
  end

  def play
    self.welcome
    self.place_ships
    self.take_turn
    if @player_one.grid.sunk?
      puts "Congratulations, #{@player_two.name}!"
    else
      puts "Congratulations, #{@player_one.name}!"
    end
  end

end
