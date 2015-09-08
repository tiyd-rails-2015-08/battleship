class Ship
  attr_reader :length


  def initialize(length, already_placed = Array.new)
    @length = length
    @already_placed = already_placed
  end

  def place(number1, number2, x = true)
    if grid.has_ship_on? == false
      put " 0 "
   else
     puts "There's already a ship there."

  end

  def covers?(number1, number2)
  if @already_placed.contains?[number1, number2]
    x = true
  else
    @already_placed << [number1, number2]
    ship_object = Ship.new(length.self, already_placed)
  end

  def overlaps_with?(ship)

  end

  def fire_at(number1, number2)
    covers?(number1, number2)
    if that position_object is marked as placed, change to x
    if
      true
    else
      false
    end
  end

  def sunk?
    if 7
      true
    else
      false
    end
  end

  def has_ship_on?(number1, number2)

  end

end
