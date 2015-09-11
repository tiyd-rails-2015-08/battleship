require 'minitest/autorun'
require 'minitest/pride'
require './battleship'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

def standard_placement
  ["A1","Down","A3","Down","A5","Down","A7","Down","A9","Down"]
end

def standard_ships
  "2, 3, 3, 4, 5"
end

def starting_game_status
    %Q{SHOTS TAKEN:
    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------

YOUR BOARD:
    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A | O |   | O |   | O |   | O |   | O |   |
B | O |   | O |   | O |   | O |   | O |   |
C |   |   | O |   | O |   | O |   | O |   |
D |   |   |   |   |   |   | O |   | O |   |
E |   |   |   |   |   |   |   |   | O |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

class BattleshipTest < Minitest::Test
  def self.test_order
    :alpha
  end

  def test_01_grid_can_be_bigger
    grid = Grid.new([20,20])
    assert_equal grid.size, [20,20]
    grid = Grid.new
    assert_equal grid.size, [10,10]
    refute_equal grid.size, [9,9]
    grid = Grid.new([701,701])
    assert_equal grid.size, [701,701]
    grid = Grid.new([10, 20])
    assert_equal grid.size, [10,20]
  end

  def test_02_big_grid_tracks_fires
    grid = Grid.new([30,30])
    ship = Ship.new(3)
    assert grid.place_ship(ship,15,15,true)
    assert grid.fire_at(15,15)
    assert_equal ship.shots_received.length, 1
    refute grid.fire_at(1,1)
    assert_equal ship.shots_received.length, 1
  end

  def test_03_cannot_create_too_big_grid
    assert_raises(InvalidGridSizeError) do
      grid = Grid.new([703,703])
    end
  end

  def test_05_accept_any_case_response
    $mock_inputs.clear
    $mock_inputs += "David"
    $mock_inputs += "David2"
    $mock_inputs += "normal"
    $mock_inputs += standard_ships
    $mock_inputs += "10x10"
    $mock_inputs += standard_placement.map(&:downcase)

    assert_output(starting_game_status) do
      game = Game.new(HumanPlayer.new("Tester"),ComputerPlayer.new)
    end

  end

  def test_06_can_exit_during_placement

  end

  def test_07_can_exit_during_call_shot

  end

  def test_08_display_grid_every_turn

  end

  def test_09_enable_salvo_mode

  end

  def test_10_salvo_mode_call_shot_is_num_ships

  end

  def test_11_introduction_collect_mode

  end

  def test_12_introduction_collect_players

  end
end
