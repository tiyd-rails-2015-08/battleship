#!/usr/bin/env ruby
require './game'
require 'byebug'

ship_art = %{
                                     |__
                                     |\\/
                                     ---
                                     / | [
                              !      | |||
                            _/|     _/|-++'
                        +  +--|    |--|--|_ |-
                     { /|__|  |/\\__|  |--- |||__/
                    +---------------___[}-_===_.'____                 /\\
                ____`-' ||___-{]_| _[}-  |     |_[___\\==--            \\/   _
 __..._____--==/___]_|__|_____________________________[___\\==--____,------' .7
|                         \e[1;37mWelcome to Battleship!\e[0m                      BB-61/
 \\_________________________________________________________________________|
}

puts ship_art
puts ""

# Collect Player Information and grid sizes

# Player 1
player1, player2 = nil
player1_response = ""
until player1_response != ""
  puts "\e[1;37mPlayer 1\e[0m, please tell me your \e[1;33mname\e[0m or if you are a \e[1;33mComputer\e[0m"
  player1_response = get_user_input
end

# Player 2
player2_response = ""
until player2_response != ""
  puts "\e[1;37mPlayer 2\e[0m, please tell me your \e[1;33mname\e[0m or if you are a \e[1;33mComputer\e[0m"
  player2_response = get_user_input
end

# Collect Game Parameters (Salvo mode and ship number and sizes)
mode_response = ""
salvo_mode = false
unless mode_response.downcase == "salvo" || mode_response.downcase == "normal"
  print "Would you like to play the \e[1;33mnormal\e[0m or \e[1;33msalvo\e[0m mode? "
  mode_response = get_user_input
end
mode_response.downcase == "salvo" ? salvo_mode = true : salvo_mode = false

ship_response = ""
loop do
  puts  "Please list me the ships and their lengths. "\
        "For example: 2, 3, 3, 4, 5 (this is the standard ship set)"
  ship_response = get_user_input
  ship_response = ship_response.delete(" ").split(",").map(&:to_i)
  break ship_response.length > 1
end

grid_response = ""
loop do
  puts  "Please tell me the size of your grid. \n"\
        "For example: 10x10 (this is the standard ship set)"
  grid_response = get_user_input
  grid_response.strip!
  grid_response = grid_response.split("x").map(&:to_i)
  break grid_response.length > 1
end

# Start the game

if player1_response.downcase == "computer"
  player1 = ComputerPlayer.new(grid_response)
else
  player1 = HumanPlayer.new("#{player1_response}", grid_response)
end

if player2_response.downcase == "computer"
  player2 = ComputerPlayer.new(grid_response)
else
  player2 = HumanPlayer.new("#{player2_response}", grid_response)
end


game = Game.new(player1, player2, ship_response, salvo_mode)
game.play
