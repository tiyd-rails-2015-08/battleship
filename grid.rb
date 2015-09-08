class Grid

  def initialize
    position_objects_array = Array.new
    10.times do
      counter =1
      position_objects_array_a = Position.new(1, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_b = Position.new(2, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_c = Position.new(3, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_d = Position.new(4, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_e = Position.new(5, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_f = Position.new(6, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_g = Position.new(7, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_h = Position.new(8, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_i = Position.new(9, counter)
      counter +=
    end
    10.times do
      counter =1
      position_objects_array_j = Position.new(10, counter)
      counter +=
    end
    position_objects_array << position_objects_array_a
    position_objects_array << position_objects_array_b
    position_objects_array << position_objects_array_c
    position_objects_array << position_objects_array_d
    position_objects_array << position_objects_array_e
    position_objects_array << position_objects_array_f
    position_objects_array << position_objects_array_g
    position_objects_array << position_objects_array_h
    position_objects_array << position_objects_array_i
    position_objects_array << position_objects_array_j
  end

  def get_user_input
    gets.chomp
  end

  def empty_grid
    %Q{    1   2   3   4   5   6   7   8   9   10
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
}
  end

  def display
    puts empty_grid
  end

  def place_ship(ship_object, number1, number2, x = false)

  end

  def has_ship_on?(number1, number2)
    search through Array of position objects and
    if a position object in the array has .number1 == number1 && .number2 == number2 return true
    else false
    end
  end

end
