class Game

  def initialize(player1, player2)
     @player1 = player1
     @player2 = player2
     @p1_turn = true
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!"
    puts "It's time to play Battleship."
  end

  def place_ships
    @player1.place_ships([2, 3, 3, 4, 5])
    @player2.place_ships([2, 3, 3, 4, 5])
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player2.grid.display_shots_grid
    puts
    puts "YOUR BOARD:"
    @player1.grid.display_boat_grid
  end

  def take_turn
    if @p1_turn
      target = @player1.call_shot
      x = @player2.grid.x_of(target)
      y = @player2.grid.y_of(target)
      if @player2.grid.fire_at(x, y) == true
        puts "Hit!"
      else
        puts "Miss!"
      end
    @p1_turn = false
    else
      target2 = @player2.call_shot
      x = @player1.grid.x_of(target2)
      y = @player1.grid.y_of(target2)
      if @player1.grid.fire_at(x, y) == true
        puts "Hit!"
      else
        puts "Miss!"
      end
    @p1_turn = true
    end
  end

  def play
      until @player1.grid.sunk? || @player2.grid.sunk? do
        take_turn
      end
    end
    if @player2.grid.sunk? == true
      puts "Congratulations, #{@player1.name}!"
    elsif @player1.grid.sunk? == true
      puts "Congratulations, #{@player2.name}!"
    end
  end

end
