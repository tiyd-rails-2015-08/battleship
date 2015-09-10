require './human_player'
require './computer_player'
require './ship'
require './grid'
require './position'
require './game'

human = HumanPlayer.new("Ruti")
human2 = HumanPlayer.new("Tyler")
game = Game.new(human, human2)

game.play
