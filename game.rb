require './human_player'
require './computer_player'

class Game
  attr_accessor :ship_lengths
  attr_accessor :salvo
  attr_accessor :player_one
  attr_accessor :player_two
  attr_accessor :player_one_turn

  def initialize(player_one, player_two, ship_lengths = [2,3,3,4,5], salvo = false)
    @player_one = player_one
    @player_two = player_two
    @ship_lengths = ship_lengths
    @salvo = salvo
    @player_one_turn = true # maybe later we'll flip a coin, [false,true].sample
  end

  def welcome
    puts "Welcome, #{@player_one.name} and #{@player_two.name}!\nIt's time to play Battleship."
  end

  def display_status
    @player_one_turn ? player = @player_one : player = @player_two
    shots_board = Hash.new(" ")
    player.shots_fired.each do |shot|
      next unless shot.position || (shot.x && shot.y)
      shot.hit == true ? shots_board[shot.position.to_sym] = "+" : shots_board[shot.position.to_sym] = "-"
    end

    puts "SHOTS TAKEN:"
    player.grid.display(shots_board)
    puts ""
    puts "YOUR BOARD:"
    player.grid.display
  end

  def take_turn
    shooter, victim, guess = nil
    if @player_one_turn
      shooter = @player_one
      victim = @player_two
      @player_one_turn = false
    else
      shooter = @player_two
      victim = @player_one
      @player_one_turn = true
    end

    if salvo
      # TODO
      # Difference is to have a shot for every ship on the grid during each turn.
      # Call your shots first, and then determine if they're hits or misses.
    else
      guess = shooter.call_shot
      x = victim.grid.x_of(guess)
      y = victim.grid.y_of(guess)
      if victim.grid.fire_at(x, y)
        puts("Hit!")
        shooter.shots_fired.last.hit = true
      else
        puts("Miss!")
      end
    end

  end

  def play
    self.welcome
    self.take_turn until (@player_one.grid.sunk? || @player_two.grid.sunk?)
    @player_one.grid.sunk? ? puts("Congratulations, #{@player_two.name}!") : puts("Congratulations, #{@player_one.name}!")
  end

  def place_ships
    @player_one.place_ships(@ship_lengths)
    @player_two.place_ships(@ship_lengths)
  end

end
