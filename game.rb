require './human_player'
require './computer_player'
require './grid'
require './ship'

class Game
  attr_accessor :shiplengths
  attr_accessor :salvo
  attr_accessor :player_one
  attr_accessor :player_two

  def initialize(player_one, player_two, shiplengths = [5,4,3,3,2], salvo = false)
    @player_one = player_one
    @player_two = player_two
    @shiplengths = shiplengths
    @salvo = salvo
  end

  def welcome
    puts "Welcome, #{@player_one.name} and #{@player_two.name}!\nIt's time to play Battleship.\n"
  end

  def display_status
    #TODO
  end

  def take_turn
    #TODO
  end

  def play
    #TODO
  end

end
