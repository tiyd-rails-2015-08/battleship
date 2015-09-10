require 'minitest/autorun'
require 'minitest/pride'
require './battleship'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
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

  def test_04_invalid_position_callout

  end

  def test_05_accept_any_case_response

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
